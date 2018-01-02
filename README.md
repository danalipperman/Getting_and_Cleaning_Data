## Getting and Cleaning Data - Course Project

The purpose of this project is to create a tidy dataset that can be used for further analysis based on data collected from the accelerometers from the Samsung Galaxy S smartphone.

The R script contained in this repository, run_analysis.R, does the following:

1. Downloads the Samsung data to the working directory and unzips the zip file to the working directory.  Note that this is all done in the R script and you do not need to separately download or organize the downloaded files.

2. Reads in the test and train text files into R, including the subject, X and Y files for each (6 text files in total).

3. Merges the 3 test data frames into one test data frame. Repeats this step for the 3 train data frames as well.

4. Merges the test and training data sets to create one data set.

5. Reads in the features text file into R and uses these names as the column names in the merged data set.

6. Extracts only the measurements on the mean and standard deviation for each measurement using dplyr. Note that there are duplicate column names in the data set that need to be removed first, but none of them are related to mean or standard deviation and are not needed in final data set (R script checks for this).

7. Uses descriptive activity names to name the activities in the data set instead of using numbers in the second column. These activity names are read into R from the activity labels text file.

8. Appropriately relabels the data set with descriptive variable names, including replacing -'s with _'s, getting rid of all ()'s and replacing leading f's and t's with more descriptive names.

9. From this data set, the R script creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is done by grouping by Subject and Activity, and then summarizing using the mean function, all using the dplyr package.

10. Finally, this second tidy dataset is exported to a text file in the working directory using the write.table function in R.