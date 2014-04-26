============
Study design
============
Data:
Data were obtained from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Extensive background information on this dataset can be obtained at the following URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

=========
Code book
=========
This dataset contains the following variables:
subject:  This indicates the subject number of the subject in the original study (vide supra "Data"). Please note that data from the "training" and "test" subjects have been merged into a single training set.
activity: A descriptive name denoting the activity performed by the subject. Mapping was performed according to "activity_labels" which can be found in the "UCI HAR Dataset" root directory.

The following variables are summaries of variables 1-6 listed in "features.txt" which is also available in the "UCI HAR Dataset" folder. Means were calculated for each unique combination of subject and activity.
mean_x_acceleration: mean of tBodyAcc-mean()-x for each unique subject and activity combination
mean_y_acceleration: mean of tBodyAcc-mean()-y for each unique subject and activity combination
mean_z_acceleration: mean of tBodyAcc-mean()-z for each unique subject and activity combination
standard_deviation_x_acceleration: mean of tBodyAcc-std()-x for each unique subject and activity combination
standard_deviation_y_acceleration: mean of tBodyAcc-std()-x for each unique subject and activity combination
standard_deviation_z_acceleration: mean of tBodyAcc-std()-x for each unique subject and activity combination

I interpreted "mean and standard deviation" as referring to the accelerometer data. This does appear to be the consensus among both students and CTAs.

================
Instruction List
================

* For consistency, R 2.15.3 is recommended though later R versions may work. 
    *  Specifically, package "reshape2" will produce a warning message when installed under R version 3.0.3
    * All work was done in R GUI although the author has no reason to believe that other systems (e.g. RS tudio) would not work.
*  Ensure that that the following package has been installed: reshape2.
*  Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip into a folder named "UCI HAR Dataset"
*  Set the working directory to "UCI HAR Dataset" (e.g. "C:\UCI HAR Dataset" or whatever fully-qualified path gets you to inside the "UCI HAR Dataset" directory).
    *  Caution is required as certain unzip tools may nest the "UCI HAR Dataset" directory within a directory which is itself named "UCI HAR Dataset". If this occurrs, you must set the working directory to the innermost directory with the specified title. You will know that you are in the correct directory when you see two subdirectories named "test" and "train"
*  Run "run_analysis.R". This may be accomplished by either of the following steps:
   *   Copy the R code from "run_analysis.R" in the repo directly into R GUI.
   *  Download "run_analysis.R" into the "UCI HAR Dataset" directory.

==========================
Notes on the Tidy Data Set
==========================
*  After running the script you will find the "tidyUCF.csv" file in the "UCI HAR Dataset" directory.
*  Open "tidyUCF.csv" in Excel. The data should import automatically.
   *   If for any reason the data does not import properly, use the text import wizard and select "comma" as the delimiter.
   *  Alternatively, you may open the "tidyUCFcsv.txt" file in Excel. Highlight the first column. Select "Text Import Wizard" tool. Select "comma" as delimiter. Press "Finish".
* You should now have a tidy data set with each variable in a separate column and each observation in a separate row.
* You may remove the first column which contains the row numbers. This will not affect the integrity of the data and is suggested purely for esthetic reasons.
