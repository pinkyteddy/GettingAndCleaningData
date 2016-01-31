#Dowloading data from website and unzip
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- file.path(getwd(), "UCIDataset.zip")
download.file(fileURL, destFile )
unzip(destFile)

#Read data
myDir<- file.path(getwd(), "UCI HAR Dataset")


#Read dara
activityTest <- read.table(file.path(myDir,"test", "y_test.txt"),header =FALSE)
activityTrain <- read.table(file.path(myDir,"train", "y_train.txt"),header =FALSE)

subjectTest <- read.table(file.path(myDir,"test", "subject_test.txt"),header =FALSE)
subjectTrain <- read.table(file.path(myDir,"train", "subject_train.txt"),header =FALSE)

featureTest <- read.table(file.path(myDir,"test", "X_test.txt"),header =FALSE)
featureTrain <- read.table(file.path(myDir,"train", "X_train.txt"),header =FALSE)

# Merge data by rows
activityData <- rbind(activityTrain, activityTest)
subjectData <- rbind(subjectTrain, subjectTest)
featureData <- rbind(featureTrain, featureTest)

#Namming the coloumn 
colnames(activityData) <- "activityId"
colnames(subjectData) <- "subjectId"
featureName <- read.table(file.path(myDir, "features.txt") ,head=FALSE)
colnames(featureData) <- featureName[,2]

#Merge all data in to 1 dataset
finalDataset <- cbind(activityData, subjectData, featureData)
colNames <- colnames(finalDataset)

#Extracts only the measurements on the mean and standard deviation for each measurement.

selectedReq <- (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames));
mydata <- finalDataset[selectedReq == TRUE]
rm("finalDataset")

#Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(myDir, "activity_labels.txt") ,head=FALSE);
colnames(activityLabels) <- c('activityId','activity');
mydata <- merge(activityLabels,mydata, by='activityId')
mydata <- mydata[, -1] #remove activityId column

#Appropriately labels the data set with descriptive variable names.
colNames <- colnames(mydata)
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyroscope",colNames[i])
  colNames[i] = gsub("AccMag","AccelerometerMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroscopeMagnitude",colNames[i])
}
colnames(mydata) <- colNames

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(dplyr)
tidyData <- group_by(mydata, subjectId, activity)
tidyData<- summarise_each(tidyData,funs(mean))
savedFile <- file.path(getwd(), "tidydata.txt")
write.table(tidyData, file = savedFile ,row.name=FALSE)

