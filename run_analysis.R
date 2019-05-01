//Getting and Cleaning Data Assignment
//run_analysis.R


//I. Access unzipped assignment folder
getwd()
setwd("UCI HAR Dataset")


//II. Read the data from the target files
list.files(recursive =TRUE)
activityTestFile  <- read.table(file.path("test" , "Y_test.txt" ),header = FALSE)
activityTrainFile  <- read.table(file.path("train" , "Y_train.txt" ),header = FALSE)
subjectTestFile <- read.table(file.path("test", "subject_test.txt"),header = FALSE)
subjectTrainFile <- read.table(file.path("train", "subject_train.txt"),header = FALSE)
featuresTestFile  <- read.table(file.path("test" , "X_test.txt"),header = FALSE)
featuresTrainFile  <- read.table(file.path("train" , "X_train.txt"),header = FALSE)
str(activityTestFile)
str(activityTrainFile)
str(subjectTestFile)
str(subjectTrainFile)
str(featuresTestFile)
str(featuresTrainFile)


//1. Merge the training and the test sets to create one data set
subjectDataSet <- rbind(subjectTrainFile, subjectTestFile)
activityDataSet <- rbind(activityTrainFile, activityTestFile)
featuresDataSet <- rbind(featuresTrainFile, featuresTestFile)
names(subjectDataSet) <- c("subject")
names(activityDataSet) <- c("activity")
namesFeatures <- read.table(file.path("features.txt"), head = FALSE)
namesFeatures
dim(featuresDataSet)
names(featuresDataSet) <- namesFeatures$V2
bind1 <- cbind(subjectDataSet, activityDataSet)
fullDataSet <- cbind(featuresDataSet,bind1)


//2. Extract only the measurements on the mean and standard deviation for each measurement
meanAndstdCols <- namesFeatures$V2[grep("mean\\(\\)|std\\(\\)", namesFeatures$V2)]
measurmentsCols <- c(as.character(meanAndstdCols), "subject", "activity")
newDataSet <- subset(fullDataSet, select = measurmentsCols)
str(newDataSet)


//3. Use descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path("activity_labels.txt"),header = FALSE)
head(newDataSet$activity,30)
newDataSet$activity <- factor(newDataSet$activity)
levels(newDataSet$activity) = activityLabels$V2
head(newDataSet$activity, 30)


//4. Appropriately label the data set with descriptive variable names
names(newDataSet)
names(newDataSet) <- gsub("^t", "Time", names(newDataSet))
names(newDataSet) <- gsub("Acc", "Accelerometer", names(newDataSet))
names(newDataSet) <- gsub("Gyro", "Gyroscope", names(newDataSet))
names(newDataSet) <- gsub("Mag", "Magnitude", names(newDataSet))
names(newDataSet) <- gsub("^f", "Frequency", names(newDataSet))
names(newDataSet) <- gsub("^subject", "Subject", names(newDataSet))
names(newDataSet) <- gsub("^activity", "Activity", names(newDataSet))
names(newDataSet)


//5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
newDataSet2 <- aggregate(. ~Subject + Activity, newDataSet, mean)
newDataSet2 <- newDataSet2[order(newDataSet2$Subject, newDataSet2$Activity),]
write.table(newDataSet2, file = "tidydataset.txt", row.name=FALSE)
