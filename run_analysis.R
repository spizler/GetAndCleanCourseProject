# run_analysis.R
# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
# Read in X_train and y_train
XTrainFile = '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\train\\X_train.txt'
XTrain = read.table(XTrainFile)

yTrainFile = '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\train\\y_train.txt'
yTrain = read.table(yTrainFile)
yTrain <- rename(yTrain, activity = V1)

# add yTrain to XTrain
train <- cbind(XTrain, yTrain)

library(dplyr)

# Read in X_test and y_test
XTestFile = '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\test\\X_test.txt'
XTest = read.table(XTestFile)

yTestFile = '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\test\\y_test.txt'
yTest = read.table(yTestFile)
yTest <- rename(yTest, activity = V1)

# add yTrain to XTrain
test <- cbind(XTest, yTest)

# Concatenate the data
data = rbind(test, train)

# 2) Extracts only the measurements on the mean and standard deviation for 
#       each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set
#       with the average of each variable for each activity and each subject.