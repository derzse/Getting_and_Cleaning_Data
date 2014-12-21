Getting and Cleaning Data Course Project
========================================
This file describes how run_analysis.R script works.
* The run_analysis.R script need to be saved in the working directory.
* Run the script in RStudio with source("run_analysis.R") command.
* The script downloads the archive from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and saves it in the working directory under the "data.zip" name.
* Running the script will unzip the "data.zip" archive into the "UCI HAR Dataset" directory, in the working directory.
* The steps that are followed by the run_analysis.R script in order to clean the data are:   
 * Reads *X_train.txt*, *y_train.txt* and *subject_train.txt* files from the "./UCI HAR Dataset/train" folder and store them in **trainData**, **trainLabel** and **trainSubject** variables.       
 * Reads *X_test.txt*, *y_test.txt* and *subject_test.txt* from the "./UCI HAR Dataset/test" folder and store them in **testData**, **testLabel** and **testSubject** variables.  
 * Merge **testData** to **trainData** to generate a 10299x561 data frame, **allData**; 
 * Merge **testLabel** to **trainLabel** to generate a 10299x1 data frame, **allLabel**; 
 * Merge **testSubject** to **trainSubject** to generate a 10299x1 data frame, **allSubject**.  
 * Read the features.txt file from the "/UCI HAR Dataset" folder and store the data in a variable called **features**. 
 * Extract the measurements on the mean and standard deviation. We will get a subset of **allData** with the 66 corresponding columns.  
 * Clean the column names of the subset by removing the "()" and "-" symbols in the names, and also capitalizing the words "mean" and "std" to "Mean" and "StD".   
 * Read the activity_labels.txt file from the "./UCI HAR Dataset" folder and store the data in a variable called **activity**.  
 * Clean the activity names in the second column of **activity**. Remove the underscore and capitalize the first letter and the letter immediately after the underscore.  
 * Combine the **allSubject**, **allLabel** and **allData** by column to get a new cleaned 10299x68 data frame, **cleanedData**. 
 * Change the name for the first two columns to "Subject" and "Activity". 
 * Create an independent tidy data set with the average of each measurement for each activity and each subject. The data contains 30 unique subjects and 6 unique activities. For each pair of (subject, activity) we calculate the mean of measurement. The data will be a 180x68 data frame.
 * Write the **data** in the working directory under the "means_data.txt" file. 
* The script will generate an output file in the working directory, called "means_data.txt" (approximately 220 KB). 
* The txt file contains a data frame called "data"" having a 180x68 dimension.
* To use it, load the file with the **data <- read.table("means_data.txt")** command in RStudio. 

