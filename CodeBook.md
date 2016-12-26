# Data Description

Information about the variables, data and the transformations made during the "cleaning" process:

# Original Data Set included:

1) List of all features:'features.txt';

2) Class labels and their activity name:'activity_labels.txt';

3) Training set and labels, respectively:'train/X_train.txt'/'train/y_train.txt';

4) ID's of subjects in the training data:'train/subject_train.txt':

5) Same as 3) and 4) for the testing data.

#Variables:

- TrainingSet, TrainingLabels, TestSet, Testlabels, SubjectTrain and SubjectTest contain the data from the downloaded files;

- AllFeatures: contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data;

- activityLabels: joins class labels with their activity name;

- MergeAllSets: merges all sets in a big dataset;

- MeanAndStdSet avera contains the relevant averages which will be later stored in a .txt file. 




