## Code Book for tidyData Data Set

This code book describes the variables, the data, and any transformations or work that was performed to clean up the data (from UCI HAR Dataset to tidyData data set).

### Source Data

The source data are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the original data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Please refer to the README.txt file within the original data set folder (i.e. UCI HAR Dataset folder) for more information on the original data set.


### Data Transformation

The original data set is processed by run_analysis.R script to generate the tidyData data set.

There are five steps to this transformation:

- Step 1: Merges the training and the test sets

Test and training data (X_train.txt, X_test.txt), activity ids (y_train.txt, y_test.txt) and subject ids (subject_train.txt, subject_test.txt) are merged to obtain three data sets (xData, yData, and subjectData). 

- Step 2: Extracts only the measurements on the mean and standard deviation

Only the values of estimated mean (variables with labels that contain "mean()") and standard deviation (variables with labels that contain "std()") are extracted. This is done with help from feature.txt which provides the variable names for columns in the merged X data set.

- Step 3: Uses descriptive activity names

Data in merged Y data set is replaced based on look up descriptions in activity_labels.txt.

- Step 4: Appropriately labels the data set

Labels based on the original data set were changed provide more descriptive variable names (e.g. removal of parentheses and dashes, etc).

- Step 5: Create a tidy data set

The final tidyData data set where numeric variables are averaged for each activity and each subject.


### tidyData Data Set Information

The tidyData data set contains 108 observations with 68 variables. 

For each record it is provided:-

* an activity label (ActivityName): factor w/ 6 levels - "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
* an identifier of the subject who carried out the experiment (SubjectID): int 1:30
* a 66-feature vector with time and frequency domain signal variables (numeric)

The 66-feature vector includes:-

* Mean and Standard Deviation for tBodyAcc and fBodyAcc for XYZ axis
* Mean and Standard Deviation for tGravityAcc for XYZ axis
* Mean and Standard Deviation for tBodyAccJerk and fBodyAccJerk for XYZ axis
* Mean and Standard Deviation for tBodyGyro and fBodyGyro for XYZ axis
* Mean and Standard Deviation for tBodyGyroJerk for XYZ axis
* Mean and Standard Deviation for tBodyAccMag and fBodyAccMag
* Mean and Standard Deviation for tGravityAccMag
* Mean and Standard Deviation for tBodyAccJerkMag and fBodyAccJerkMag
* Mean and Standard Deviation for tBodyGyroMag and fBodyGyroMag
* Mean and Standard Deviation for tBodyGyroJerkMag and fBodyGyroJerkMag