## Getting and Cleaning Data Course Project

This is the repository for deliverables of Getting and Cleaning Data course project.


### Project Description

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R created does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### Files and folders inside this repository

* README.md: This file provides a brief overview of this repository
* CodeBook.md: This code book describes the variables, the data, and any transformations or work that you performed to clean up the data
* UCI HAR Dataset: This folder contains the input data, which are downloaded and unzipped from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Note that the inertia subfolder within this folder has been removed as they are not used for this project.
* run_analysis.R: This is the R script used to process the data and generated the required tidy dataset for project
* tidyData.txt: This is the text file with the required tidy data set for the project


### Description on how run_analysis.R script works

The script assumes relevant data has been downloaded and extracted into the UCI HAR Dataset folder within the working directory.

Step 1a: Read the three sets (X, Y and Subject) of training and test data

Step 1b: Bind the training and test data into the relevant sets (i.e. x_train with x_test, y_train with y_test, and subject_train with subject_test)

Step 2: Extract only the data with "mean()" and "std()" (within the variable name) from X data set. Note that the column names are within the features.txt file, hence need to first extract out the relevant columns from features.txt, then map and extract the relevant columns from X data set.

Step 3: Match and update the data within Y data set based on the mapping from activity_labels.txt file. This will provide more descriptive activity names for data in Y data set. 

Step 4a: Before this step, variables in X, Y and Subject data sets have no meaningful names (i.e. Var1, Var2, etc). Therefore, assign meaningful and descriptive names to the variables in those data sets. Note that since column names from X data set came from features.txt, need to extract (and clean up if possible) and assign the names accordingly.

Step 4b: Bind the X, Y and Subject data sets into a data set call allData.

Step 5a: Using the aggregate function, split allData into subsets (group by ActivityName and SubjectID) and calculate the mean for those subsets. The function will return the result in a convenient form. 

Step 5b: Since the aggregate function will also tries to calculate the mean of ActivityName and SubjectID (which are meaningless) - in my case, I have previously bind them as the last 2 columns in the allData data set, I have also removed the last 2 columns from the allData data set.

Step 5c: Finally, output the allData data set to tidyData.txt file.