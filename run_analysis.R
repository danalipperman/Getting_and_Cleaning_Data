run_analysis <- function() {
  
  library(dplyr)
  
  ## Download the Samsung data to working directory and unzip the zip file
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(URL, "~\\course3data.zip")
  ziplocation <- "~\\course3data.zip"
  unzipped <- "~\\course3data"
  unzip(ziplocation, exdir=unzipped)
  
  ## Read the test and train text files into R, set header to false since no column headings in data
  subject_test <- read.table("~\\course3data\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)
  X_test <- read.table("~\\course3data\\UCI HAR Dataset\\test\\X_test.txt", header = FALSE)
  Y_test <- read.table("~\\course3data\\UCI HAR Dataset\\test\\Y_test.txt", header = FALSE)
  subject_train <- read.table("~\\course3data\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)
  X_train <- read.table("~\\course3data\\UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
  Y_train <- read.table("~\\course3data\\UCI HAR Dataset\\train\\Y_train.txt", header = FALSE)
  
  ## Merge the test text files, then merge the train text files.  Subject, Y and X text files have same number of rows, using cbind to merge the files (same goes for Subject, Y and X train text files).  Note that the subject_test text file contains even numbers and the subject_train text file contains odd numbers so they contain different subjects.
  test_merged <- cbind(subject_test, Y_test, X_test)
  train_merged <- cbind(subject_train, Y_train, X_train)
  
  
  ## 1. Merges the training and the test sets to create one data set. 
  ## Merge using rbind, they have the same columns and are different subjects so can be appended
  merged <- rbind(test_merged, train_merged)
  
  ## Add column names to merged data from features (features corresponds to X text files)
  features <- read.table("~\\course3data\\UCI HAR Dataset\\features.txt", header = FALSE, stringsAsFactors = FALSE)
  features <- features[2]
  colnames(merged)[1:2] <- c("Subject", "Activity")
  colnames(merged)[3:563] <- as.character(features[,1])
  
  
  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  ## Check for duplicate column names, confirm that none are mean or standard deviation variables.
  
  colnames(merged)[duplicated(colnames(merged))]
  
  ## Remove duplicate column names.
  
  merged_clean <- merged[ , !duplicated(colnames(merged))]
  
  ## Subset the previous dataframe to pull variables that are mean or standard deviations, in addition to the first two columns
  merged_sub <- select(merged_clean, 1:2, contains("mean()"), contains("std()"))
  
  
  ## 3. Uses descriptive activity names to name the activities in the data set. 
  ## Match second column, Activity, to the labels in activity_labels text file
  activity_labels <- read.table("~\\course3data\\UCI HAR Dataset\\activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
  merged_sub$Activity <- sapply(merged_sub$Activity, function(x) activity_labels[activity_labels$V1 == x, ]$V2)

  
  ## 4. Appropriately labels the data set with descriptive variable names.
  ## Replaced -'s with _'s
  colnames(merged_sub) <- gsub("-","_",colnames(merged_sub))
  
  ## Took out ()s from variable names
  colnames(merged_sub) <- gsub("\\(\\)","",colnames(merged_sub))
  
  ## Replaced f's with Freq_ and t's with Time_
  colnames(merged_sub) <- gsub("^f","Freq_",colnames(merged_sub))
  colnames(merged_sub) <- gsub("^t","Time_",colnames(merged_sub))
  
  
  ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  newdata <- merged_sub
  newdata <- newdata %>%
    group_by(Subject, Activity) %>%
    summarize_all(mean)
  
  ## Write the tidy dataset to a text file
  write.table(newdata, file = "~\\tidydata.txt", row.names = FALSE)
  
}
