Getting and Cleaning Data Course Project
========================================
This file describes how run_analysis.R script works.
* The run_analysis.R script need to be saved in the working directory.
* Run the script in RStudio with source("run_analysis.R") command.
* The data file is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and is saved in the working directory under the "data.zip" name.
* Running the script will unzip the "data.zip" archive into the "UCI HAR Dataset" directory, in the working directory.
* The script will generate an output file in the working directory, called "means_data.txt" (approximately 220 KB). 
* The txt file contains a data frame called "data"" having a 180x68 dimension.
* To use it, load the file with the data <- read.table("means_data.txt") command in RStudio. 
