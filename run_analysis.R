# run_analysis.R
# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
library(dplyr)

# Read in X_train and y_train
XTrainFile = '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\train\\X_train.txt'
XTrain = read.table(XTrainFile)
yTrainFile = '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\train\\y_train.txt'
yTrain = read.table(yTrainFile)
# Rename header to "activity"
yTrain <- rename(yTrain, activity = V1)
# add yTrain to XTrain
train <- cbind(XTrain, yTrain)

# Read in X_test and y_test
XTestFile = '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\test\\X_test.txt'
XTest = read.table(XTestFile)
yTestFile = '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\test\\y_test.txt'
yTest = read.table(yTestFile)
# Rename header to "activity"
yTest <- rename(yTest, activity = V1)
# add yTrain to XTrain
test <- cbind(XTest, yTest)

# Concatenate the data
data = rbind(test, train)

# 2) Extracts only the measurements on the mean and standard deviation for 
#       each measurement. 
# read in features
featuresFile = '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\features.txt'
features = read.table(featuresFile)
featNames = features[,2]
featNames <- data.frame(lapply(featNames, as.character), stringsAsFactors = FALSE)
colnames(data) <- c(featNames, "activity")

# select column names with "mean" or "std" in string
cnames <- colnames(data)
meanCols <- grep("mean", cnames)
stdCols <- grep("std", cnames)
# also add "activity" column back
stdmeanCols <- sort(c(meanCols, stdCols, 562))

# filter by those columns
data <-(data[,stdmeanCols])

# 3) Uses descriptive activity names to name the activities in the data set
data$activity[data$activity == 1] <- "WALKING"
data$activity[data$activity == 2] <- "WALKING_UPSTAIRS"
data$activity[data$activity == 3] <- "WALKING_DOWNSTAIRS"
data$activity[data$activity == 4] <- "SITTING"
data$activity[data$activity == 5] <- "STANDING"
data$activity[data$activity == 6] <- "LAYING"

# 4) Appropriately labels the data set with descriptive variable names. 
# done as part of 2)

# 5) From the data set in step 4, creates a second, independent tidy data set
#       with the average of each variable for each activity and each subject.
subjectTestFile <- '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\test\\subject_test.txt'
subjectTest <- read.table(subjectTestFile)
subjectTrainFile <- '.\\School\\JHU\\DataScience\\GetAndCleanCourseProject\\UCI HAR Dataset\\train\\subject_train.txt'
subjectTrain <- read.table(subjectTrainFile)
subjectData = rbind(subjectTest, subjectTrain)
data <- cbind(subjectData, data)
data <- rename(data, subject = V1)


library(reshape2)








