## This script will perform the following steps on the UCI HAR Dataset:
##
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each
##    measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each
##    variable for each activity and each subject.


## Step 1: Merges the training and the test sets to create one data set.

xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Merge training and test X data sets
xData <- rbind(xTrain, xTest)

## Merge training and test Y data sets
yData <- rbind(yTrain, yTest)

## Merge training and test subject data sets
subjectData <- rbind(subjectTrain, subjectTest)


## Step 2: Extracts only the measurements on the mean and standard deviation for
## each measurement.

features <- read.table("UCI HAR Dataset/features.txt")

## Extract mean() or std() columns in xData based on features table
meanStdFeatures <- grep("(mean|std)\\(\\)", features[, 2])
xData <- xData[, meanStdFeatures]


## Step 3: Uses descriptive activity names to name the activities in the data set.

activities <- read.table("UCI HAR Dataset/activity_labels.txt")

## Update labels with correct activity names based on activities table
yData[, 1] <- activities[yData[, 1], 2]


## Step 4: Appropriately labels the data set with descriptive activity names.

## Provide descriptive names to the variables for the data sets
names(yData) <- "ActivityName"
names(subjectData) <- "SubjectID"

## Further cleaning up of the descriptive names of variables for x data set
features[,2] <- gsub('-mean', 'Mean', features[,2])
features[,2] <- gsub('-std', 'Std', features[,2])
features[,2] <- gsub('[-()]', '', features[,2])
names(xData) <- features[meanStdFeatures, 2]

## Bind all three data sets together
allData <- cbind(xData, yData, subjectData)


## Step 5: Creates a second, independent tidy data set with the average of each
## variable for each activity and each subject.

tidyData <- aggregate(allData, list(ActivityName = allData$ActivityName, 
                                       SubjectID = allData$SubjectID), mean)

## Remove last two variables from tidyData data set since mean of those variables
## are useless (i.e. mean of ActivityName and SubjectID)
tidyData[,ncol(tidyData)] <- NULL
tidyData[,ncol(tidyData)] <- NULL

## Create a textfile to output the tidyData data set
write.table(tidyData, 'tidyData.txt', row.names=FALSE);