#### Code Book for Getting and Cleaning Data Course Project

This code book describes the data, variables, and any transformations or work that was performed to clean up the data to get to the final tidy dataset, tidydata.txt.

### Data

The data used to create the tidy dataset were collected from the accelerometers from the Samsung Galaxy S smartphone. Experiements were carried out with a group of 30 volunteers within an age backet of 19-48 yeras. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of measurements was obtained by calculating variables from the time and frequency domain.

The tidy dataset contains rows for each subject for each activity performed (30 subjects x 6 activities), and columns for the Subject ID, the Activity, and then 66 additional columns corresponding to measurements.

The measurements are normalized and bounded within [-1,1].

For the tidy dataset, only those measurements related to mean and standarded deviation were included. The dataset contains the average of each variable for each Activity and each Subject.


### Variables

## Identifiers

* Subject - the ID of the subject (1 through 30)

* Activity - the type of activity performed when the corresponding measurements were taken (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying)

## Measurements

The measurements selected for this database come from the accelerometer and gyroscope 3-axial raw signals Time_Acc-XYZ and Time_Gyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Time_BodyAcc-XYZ and Time_GravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time_BodyAccJerk-XYZ and Time_BodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time_BodyAccMag, Time_GravityAccMag, Time_BodyAccJerkMag, Time_BodyGyroMag, Time_BodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Freq_BodyAcc-XYZ, Freq_BodyAccJerk-XYZ, Freq_BodyGyro-XYZ, Freq_BodyAccJerkMag, Freq_BodyGyroMag, Freq_BodyGyroJerkMag.

These signals were used to estimate variables for each pattern, where 'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Final dataset only contains the variables related to the mean and standard deviation for each measurment. Time variables begin with Time, while Frequency variables begin with Freq:

* Time_BodyAcc_mean_X          
* Time_BodyAcc_mean_Y          
* Time_BodyAcc_mean_Z        
* Time_GravityAcc_mean_X      
* Time_GravityAcc_mean_Y       
* Time_GravityAcc_mean_Z     
* Time_BodyAccJerk_mean_X      
* Time_BodyAccJerk_mean_Y      
* Time_BodyAccJerk_mean_Z      
* Time_BodyGyro_mean_X         
* Time_BodyGyro_mean_Y         
* Time_BodyGyro_mean_Z        
* Time_BodyGyroJerk_mean_X    
* Time_BodyGyroJerk_mean_Y     
* Time_BodyGyroJerk_mean_Z     
* Time_BodyAccMag_mean         
* Time_GravityAccMag_mean      
* Time_BodyAccJerkMag_mean     
* Time_BodyGyroMag_mean       
* Time_BodyGyroJerkMag_mean    
* Freq_BodyAcc_mean_X         
* Freq_BodyAcc_mean_Y         
* Freq_BodyAcc_mean_Z          
* Freq_BodyAccJerk_mean_X      
* Freq_BodyAccJerk_mean_Y      
* Freq_BodyAccJerk_mean_Z      
* Freq_BodyGyro_mean_X         
* Freq_BodyGyro_mean_Y         
* Freq_BodyGyro_mean_Z         
* Freq_BodyAccMag_mean        
* Freq_BodyBodyAccJerkMag_mean 
* Freq_BodyBodyGyroMag_mean    
* Freq_BodyBodyGyroJerkMag_mean
* Time_BodyAcc_std_X           
* Time_BodyAcc_std_Y           
* Time_BodyAcc_std_Z           
* Time_GravityAcc_std_X        
* Time_GravityAcc_std_Y        
* Time_GravityAcc_std_Z        
* Time_BodyAccJerk_std_X       
* Time_BodyAccJerk_std_Y       
* Time_BodyAccJerk_std_Z       
* Time_BodyGyro_std_X          
* Time_BodyGyro_std_Y          
* Time_BodyGyro_std_Z          
* Time_BodyGyroJerk_std_X      
* Time_BodyGyroJerk_std_Y      
* Time_BodyGyroJerk_std_Z      
* Time_BodyAccMag_std          
* Time_GravityAccMag_std       
* Time_BodyAccJerkMag_std      
* Time_BodyGyroMag_std         
* Time_BodyGyroJerkMag_std     
* Freq_BodyAcc_std_X           
* Freq_BodyAcc_std_Y          
* Freq_BodyAcc_std_Z           
* Freq_BodyAccJerk_std_X       
* Freq_BodyAccJerk_std_Y      
* Freq_BodyAccJerk_std_Z       
* Freq_BodyGyro_std_X        
* Freq_BodyGyro_std_Y         
* Freq_BodyGyro_std_Z          
* Freq_BodyAccMag_std          
* Freq_BodyBodyAccJerkMag_std  
* Freq_BodyBodyGyroMag_std     
* Freq_BodyBodyGyroJerkMag_std 


### Transformations

README.md located in this repository contains a more detailed step by step transformation process from the raw data to the tidy dataset (that can be performed using the R script also contained in this repository).

A high level overview of the transformation process is that I took the raw datasets for test and train and merged them all into one big dataset. I then matched the Activity # to it's corresponding name located in a different raw data file (activity_labels.txt), and matched the measurements to column names located in yet another raw data file (features.txt).

I cleaned up the names of the columns to be more straightforward, and then created a second tidy dataset that summarized the previous dataset by averaging each feature variable by Subject and Activity.
