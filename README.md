# Getting-and-Cleaning-Data-Course-Project

This repo contains a script, "run_analysis.R", that is meant for use with this data (url): https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# This script does the following:
1- Merges the training and the test sets to create one data set.

2- Extracts only the measurements on the mean and standard deviation for each measurement.

3- Uses descriptive activity names to name the activities in the data set.

4- Appropriately labels the data set with descriptive variable names.

5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#How was it constructed?
1- First, the script will read all of the tables needed.

2- Extract the features needed (STD, and MEAN), from the x_Test, and x_Train data sets.

3- Label with activity labels, the y_Test and y_Train data sets.

4- Bind all of this data together.

5- Create a new tidy data set using the subject files.

