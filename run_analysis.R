# Ensure that that the following package has been installed: reshape2.
# Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip into a folder named "UCI HAR Dataset"
# set the working directory to "UCI HAR Dataset" (e.g. C:\UAC HAR Dataset).
# For additional technical help, please see the "Readme.md" and "CodeBook.md" located in this repo.
# Numbers in the comments refer to the step of the instructions that are satisfied by the following code block.
#1. Merge the training and test sets to create one data set
setwd("train")
signals_train  <- read.table("X_train.txt") #train signals
subject_train  <- read.table("subject_train.txt") #train subject
activity_train <- read.table("y_train.txt") #train activities


setwd("../test")
signals_test          <- read.table("X_test.txt") #test signals
subject_test  <- read.table("subject_test.txt") #test subjects
activity_test <- read.table("y_test.txt") #test activities




# 3. Substitute descriptive names for the activity vectors (activity_train and activity_test)

activity_replace <- function(x) {
	n <- nrow(x)
	for (i in 1:n) {
		if (x[i,1] == 1) { x[i,1] = "Walking"} #initial cap for greater readability
		if (x[i,1] == 2) { x[i,1] = "Walking_upstairs"}
		if (x[i,1] == 3) { x[i,1] = "Walking_downstairs"}
		if (x[i,1] == 4) { x[i,1] = "Sitting"}
		if (x[i,1] == 5) { x[i,1] = "Standing"}
		if (x[i,1] == 6) { x[i,1] = "Laying"}
	}
	return(x)
}

activity_train <- activity_replace(activity_train)
activity_test  <- activity_replace(activity_test)

# 1. Merge the training and the test sets to create one data set.
testdf  <- cbind(subject_test,  activity_test,  signals_test)
traindf <- cbind(subject_train, activity_train, signals_train)
df <- rbind(testdf, traindf)
rm(list = c("testdf", "traindf"))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
d <- df[,c(1:8)]

# Give columns descriptive names 
names(d) <- c("subject", "activity", "mean_x_accelearation", "mean_y_acceleration", "mean_z_acceleration", "standard_deviation_x_acceleration", "standard_deviation_y_acceleration", "standard_deviation_z_acceleration")

# Create the tidy dataset by applying melt and dcast
library(reshape2)  #Package "reshpae" is required for the melt function. Please note that "reshape" depends on "plyr". Package "plyr" will be automatically loaded upon loading "reshape".
dmelt <- melt(d, id=c("subject", "activity"), measure.vars=c("mean_x_accelearation", "mean_y_acceleration", "mean_z_acceleration", "standard_deviation_x_acceleration", "standard_deviation_y_acceleration", "standard_deviation_z_acceleration"))
dcasted <- dcast(dmelt, subject + activity ~variable, mean)
setwd("../")
write.table(dcasted, file="tidyUCF.txt")
write.csv(dcasted, file="tidyUCFcsv.txt")
write.csv(dcasted, file="tidyUCF.csv")










