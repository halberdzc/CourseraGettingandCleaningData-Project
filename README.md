
Overall

This project is to demonstrate the process of collecting and cleaning data set using R language.

File list

Readme.md
CodeBook.md: described the dataset and variable information
Run_analysis.R is the R code to realize the data cleaning process

The logic of R code

Run_analysis.R is to process the data from folder UCI HAR Datasets, which can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
as a zip file. Then the following steps are followed to process the data:
-	Unzip the file into local directory, and then set working directory to the folder where data is saved.
-	read in all the necessary data files into R
-	assign variable names to the data records
-	combine separate data sets to get the full training and test sets
-	Five tasks listed are realized one by one
  -	Merges the training and the test sets to create one data set.
  -	Extracts only the measurements on the mean and standard deviation for each measurement. 
  -	Uses descriptive activity names to name the activities in the data set
  -	Appropriately labels the data set with descriptive variable names.
  -	creates a second, independent tidy data set with the average of each variable for each activity and each subject.



