# Getting-and-Cleaning-Data-Course-Project
 Human Activity Recognition Using Smartphones Data Set 

#Introduction
The aim of this project is to read data from the "Human Activity Recognition Using Smartphones Dataset" and produce a new dataset where tidy data can be found and used for further analysis.

#Project Overview

The idea of this project is to get used with the process of collecting, work and clean a data set. For that, the following procedures were required:
1) a tidy data set;
2) a link to a Github repository with the script for performing the analysis;
3) a code book that describes the variables, the data, and any transformations or work that were performed to clean up the data called CodeBook.md. Check this for aditional information.

# The Script

The R script used to create the tidy data file, run_analysis.R, does the following:

1 - Download and unzip the dataset if it does not exist in the working directory;
2 -	Creation of a data set, merging both training and test sets;
2.1 - Reading training and testing tables;
2.2 - Column names assignation;
2.3 - Merging all data;
3 -	Extraction of the mean and standard deviation;
4 -	Conversion of the activity and subject columns into factors;
5 -	Creates a tidy data set with the average of each variable for each activity and each subject.
