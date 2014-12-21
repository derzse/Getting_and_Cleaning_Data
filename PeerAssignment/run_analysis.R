### Read the archive file and unzip it in the working directory.
read_data <- function() {
  file_name = "./data.zip"
  source_url = "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  if(!file.exists(file_name)) {
    download.file(source_url, destfile="data.zip")
  }
}
read_data()
unzip("data.zip")

### Read and merge the training and test sets to create one data set.
### The data.zip file is unzipped in the UCI HAR Dataset directory.

## Reading the train data set.
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
## Read the test data set.
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt") 
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
## Join the train and test data set into one data set.
allData <- rbind(trainData, testData)
allLabels <- rbind(trainLabel, testLabel)
allSubject <- rbind(trainSubject, testSubject)

### Extract only the mean and standard deviation for each measurement.
### Removing extra characters and capitalizing words in the data set. 

featuresList <- read.table("./UCI HAR Dataset/features.txt")
SelectedMeanStd <- grep("mean\\(\\)|std\\(\\)", featuresList[, 2])
SelectedData <- allData[, SelectedMeanStd]
## Removing "()" and "-" from data set names
names(SelectedData) <- gsub("\\(\\)", "", featuresList[SelectedMeanStd, 2])
names(SelectedData) <- gsub("-", "", names(SelectedData))
## Capitalizing Mean and StD words in the data set names
names(SelectedData) <- gsub("mean", "Mean", names(SelectedData))
names(SelectedData) <- gsub("std", "StD", names(SelectedData))


### Change activity names in the data set to descriptive names.
### Removing extra characters and capitalizing words in the activity names.
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[, 2], 1, 1) <- toupper(substr(activity[, 2], 1, 1))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[allLabels[, 1], 2]
allLabels[, 1] <- activityLabel
names(allLabels) <- "Activity"


### Change the labels in the data set with descriptive names and write
### the new merged data set.
names(allSubject) <- "Subject"
cleanedData <- cbind(allSubject, allLabels, SelectedData)

### Create an independent tidy data set with the average of each 
### variable for each activity and each subject. 
## Set the row and columns values for the tidy data matrix
subjectLen <- length(table(allSubject))
activityLen <- dim(activity)[1]
colLen <- dim(cleanedData)[2]
## Construct the tidy data matrix and initialize it with NA values
data <- matrix(NA, nrow=subjectLen*activityLen, ncol=colLen) 
data <- as.data.frame(data)
## Fill the tidy data matrix with averages for each variable for each activity
colnames(data) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
    for(j in 1:activityLen) {
        data[row, 1] <- sort(unique(allSubject)[, 1])[i]
        data[row, 2] <- activity[j, 2]
        condSubj <- i == cleanedData$Subject
        condActivity <- activity[j, 2] == cleanedData$Activity
        data[row, 3:colLen] <- colMeans(cleanedData[condSubj&condActivity, 3:colLen])
        row <- row + 1
    }
}
head(data)
write.table(data, row.name=FALSE, "means_data.txt")
