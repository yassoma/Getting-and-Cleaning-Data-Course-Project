#Function of this script called "run_analysis.R"
# 1-Merges the training and the test sets to create one data set.
# 2-Extracts only the measurements on the mean and standard deviation
#for each measurement.
# 3-Uses descriptive activity names to name the activities in the data set.
# 4-Appropriately labels the data set with descriptive variable names.
# 5-From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.

#reading and naming all the files
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
activityLabels <-  read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
#PART 1: PREPARING THE FEATURES
#Renaming the columns
names(xTest) = features
names(xTrain) = features
names(subjectTest) = "subject"
names(subjectTrain) = "subject"

#Deciding which features we will need, in this case it's STD and MEAN.
usedFeatures <- grepl("std|mean", features[,2])
xTest <- xTest[,usedFeatures]
xTrain <- xTrain[,usedFeatures]

#merging the test and train X
X <- rbind(xTest, xTrain)

#PART 2: PREPARING THE ACTIVITY LABELS
#appending the activity names as a second column
names(yTest)[names(yTest)=="V1"] <- "ActivityID"
names(yTrain)[names(yTrain)=="V1"] <- "ActivityID"
activityLabels <- activityLabels[,2]
yTest$ActivityLabel <- activityLabels[yTest[,1]]
yTrain$ActivityLabel <- activityLabels[yTrain[,1]]

#merging the test and train Y
Y <- rbind(yTest, yTrain)

#merging X AND Y
XY <- cbind(Y, X)

subject <- rbind(subjectTest, subjectTrain)
averages <- aggregate(X, by = list(activity = Y[,1], subject = subject[,1]), mean)

#creating the tidy data
write.csv(averages, file='tidydata.txt', row.names=FALSE)
