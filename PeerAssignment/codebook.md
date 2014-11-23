Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and the transformations that were performed to clean up the data.  
* The data was obtained from :  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project is downloaded from:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

* The steps that are followed by the run_analysis.R script in order to clean the data are:   
1. The script donloads the archive into the working directory and unzips it in the "UCI HAR Dataset" directory.
2. Reads X_train.txt, y_train.txt and subject_train.txt files from the "./UCI HAR Dataset/train" folder and store them in **trainData**, **trainLabel** and **trainSubject** variables.       
2. Reads X_test.txt, y_test.txt and subject_test.txt from the "./UCI HAR Dataset/test" folder and store them in **testData**, **testLabel** and **testSubject** variables.  
3. Merge **testData** to **trainData** to generate a 10299x561 data frame, **allData**; 
4. Merge **testLabel** to **trainLabel** to generate a 10299x1 data frame, **allLabel**; 
5. Merge **testSubject** to **trainSubject** to generate a 10299x1 data frame, **allSubject**.  
6. Read the features.txt file from the "/UCI HAR Dataset" folder and store the data in a variable called **features**. 
7. Extract the measurements on the mean and standard deviation. We will get a subset of **allData** with the 66 corresponding columns.  
8. Clean the column names of the subset by removing the "()" and "-" symbols in the names, and also capitalizing the words "mean" and "std" to "Mean" and "StD".   
9. Read the activity_labels.txt file from the "./UCI HAR Dataset" folder and store the data in a variable called **activity**.  
10. Clean the activity names in the second column of **activity**. Remove the underscore and capitalize the first letter and the letter immediately after the underscore.  
11. Combine the **allSubject**, **allLabel** and **allData** by column to get a new cleaned 10299x68 data frame, **cleanedData**. 
12. Change the name for the first two columns to "Subject" and "Activity". 
13. Create an independent tidy data set with the average of each measurement for each activity and each subject. The data contains 30 unique subjects and 6 unique activities. For each pair of (subject, activity) we calculate the mean of measurement. The data will be a 180x68 data frame.
14. Write the **data** in the working directory under the "means_data.txt" file. 
