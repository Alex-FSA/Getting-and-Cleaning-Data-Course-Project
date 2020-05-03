library(plyr)
library(data.table)
library(dplyr)
library(knitr)

#read features and activities
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
dim(features)
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
dim(activities)
#data for train purposes
subjectTrain = read.table('./UCI HAR Dataset/train/subject_train.txt', col.names = "subject")
dim(subjectTrain)
trainX = read.table('./UCI HAR Dataset/train/x_train.txt', col.names = features$functions)
dim(trainX)
trainY = read.table('./UCI HAR Dataset/train/y_train.txt', col.names = "code")
dim(trainY)

#data for test purposes
subjectTest = read.table('./UCI HAR Dataset/test/subject_test.txt', col.names = "subject")
dim(subjectTest)
testX = read.table('./UCI HAR Dataset/test/x_test.txt', col.names = features$functions)
dim(testX)
testY = read.table('./UCI HAR Dataset/test/y_test.txt', col.names = "code")
dim(testY)
#1. Merges the training and the test sets to create one data set.
mergedSubject <- rbind(subjectTrain, subjectTest)
dim(mergedSubject)
mergedX <- rbind(trainX, testX)
dim(mergedX)
mergedY <- rbind(trainY, testY)
dim(mergedY)
fullMerged <- cbind(mergedSubject, mergedY, mergedX)
dim(fullMerged)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
extractData <- fullMerged %>% select(subject, code, contains("mean"), contains("std"))
dim(extractData)

#3 Uses descriptive activity names to name the activities in the data set
extractData$code <- activities[extractData$code, 2]

#4 Appropriately labels the data set with descriptive variable names. 
names(extractData)[2] = "activity"
names(extractData)<-gsub("Acc", "Accelerometer", names(extractData))
names(extractData)<-gsub("Gyro", "Gyroscope", names(extractData))
names(extractData)<-gsub("BodyBody", "Body", names(extractData))
names(extractData)<-gsub("Mag", "Magnitude", names(extractData))
names(extractData)<-gsub("^t", "Time", names(extractData))
names(extractData)<-gsub("^f", "Frequency", names(extractData))
names(extractData)<-gsub("tBody", "TimeBody", names(extractData))
names(extractData)<-gsub("-mean()", "Mean", names(extractData), ignore.case = TRUE)
names(extractData)<-gsub("-std()", "STD", names(extractData), ignore.case = TRUE)
names(extractData)<-gsub("-freq()", "Frequency", names(extractData), ignore.case = TRUE)
names(extractData)<-gsub("angle", "Angle", names(extractData))
names(extractData)<-gsub("gravity", "Gravity", names(extractData))

#5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
secondData <- extractData %>%
      group_by(subject, activity) %>%
      summarise_all(funs(mean))
write.table(secondData, "FinalData.txt", row.name=FALSE)

knit2html("codebook.Rmd")

