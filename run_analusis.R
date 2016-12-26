library(reshape2)

filename <- "getdata_dataset.zip"

# 1- Download and unzip the dataset:

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, filename, method="curl")
  
if (!file.exists("UCI HAR Dataset"))
unzip(filename)

# 2- Create a data set merging both training and test sets:

# 2.1 - Reading training and testing tables:

TrainingSet <- read.table("UCI HAR Dataset/train/X_train.txt")
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
TrainingLabels <- read.table("UCI HAR Dataset/train/Y_train.txt")
TestSet <- read.table("UCI HAR Dataset/test/X_test.txt")
Testlabels <- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

AllFeatures <- read.table ("UCI HAR Dataset/features.txt")

activityLabels = read.table("UCI HAR Dataset/activity_labels.txt")

# 2.2 - Assigning column names:

colnames(TrainingSet) <- AllFeatures[,2]
colnames(TrainingLabels) <- "activityId"
colnames(SubjectTrain) <- "subjectId"

colnames(TestSet) <- AllFeatures[,2]
colnames(Testlabels) <- "activityId"
colnames(SubjectTest) <-"subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# 2.3 - Merging all data:

merge_train <- cbind(TrainingLabels,SubjectTrain,TrainingSet)
merge_test <- cbind(Testlabels,SubjectTest,TestSet)
MergeAllSets <- rbind(merge_train,merge_test)

# 3 - Extracting mean and standard deviation

colNames <- colnames(MergeAllSets)

Vector <- (grepl("activityId",colNames) | grepl("subjectId",colNames) | grepl("mean..", colNames) | grepl("std..",colNames))

MeanAndStdSet <- MergeAllSets[ , Vector == TRUE]

# 4 - Descriptive activity names to name the activities in the data set

setActivityNames <- merge(MeanAndStdSet,activityLabels,by = 'activityId',all.x = TRUE)
           
# 5 - Tidy data set with the average of each variable for each activity and each subject

# 5.1 - Create a second tidy data set

TidySet2 <- aggregate(.~subjectId + activityId, setActivityNames, mean)
TidySet2 <- TidySet2[order(TidySet2$subjectId,TidySet2$activityId),]
  
# 5.2 - txt file with second tidy data set

write.table(TidySet2,"TidySet2.txt",row.name=FALSE)
















