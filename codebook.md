##Project Description

The goal was to create an R script (run_analysis.R) that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Raw Data

This project uses data from Human Activity Recognition Using Smartphones Data Set, found in the UC Irvine Machine Learning Repository. Raw data was retrieved from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Additional information on the UCI Project, including documentation, is available at: http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions. 

Raw data included:
- Subject identifiers (1-30)
- Labels to identify the activities
- 561 attributes with time and frequency
- Triaxial acceleration from the accelerometer
- Estimated body acceleration
- Triaxial Angular velocity from the gyroscope

Aside from labels and subject identifiers, data was organized in two sub-folders: test and train. 

##Instructions

1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it. 
2. If you have not previously done so, install Reshape2. 
3. Read the data files, including the six files housed in the test and train folders. 
4. Using rbind, complementary files in test and train were combined (e.g., test/x_file with train/x_file). This produced three files.
5. Descriptive column names were applied using information provided in the original dataset
6. The three files were combined into one with cbind.
7. Columns that included mean or standard deviation were identified using grepl
8. The complete dataset was subset using the columns identified in Step 4
9. A tidy data set isolating the average of each variable for each activity and each subject is created using melt and dcast. 

Please see the readme.txt file for detailed instructions.

##Variables

From the original documentation:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.  

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

In cleaning the data and to improve readability, some changes were made to the names. These are listed below: 

bodyacceleration-xyz: formerly tBodyAcc-XYZ and fBodyAcc-XYZ
gravityacceleration-xyz: formerly tGravityAcc-XYZ
bodyaccelerationjerk-xyz: formerly tBodyAccJerk-XYZ and fBodyAccJerk-XYZ
bodygyroscope-xyz: formerly tBodyGyro-XYZ and fBodyGyro-XYZ
bodygyroscopejerk-xyz: formerly tBodyGyroJerk-XYZ 
bodyaccelerationmag-xyz: formerly tBodyAccMag and fBodyAccMag
gravityaccelerationmag-xyz: formerly tGravityAccMag
bodyaccelerationjerkmag-xyz: formerly tBodyAccJerkMag and fBodyAccJerkMag
bodygyroscopemag-xyz: formerly tBodyGyroMag and fBodyGyroMag
bodygyroscopejerkmag-xyz: formerly tBodyGyroJerkMag and fBodyGyroJerkMag
