##Introduction
This is the Code Book for the Getting and Cleaning Data assignment as part of the Courera Data Science specialization. This Code Book describes the data, variables, and code transformations executed as part of this analysis.

##Data
The data for this analysis come from a series of experiments carried out by UC-Irvine researchers with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). For more information on the data, please visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones or review the file 'features_info.txt' that is included in the experimental data package. 

##Variables
The data described above was collected in the following measurements. '-XYZ' indicates that a variable was collected for each of the three axes, X, Y, and Z.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


The set of variables that were estimated from these measurements above include: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

The complete list of input variables of each feature vector is available in 'features.txt'. 

For purposes of our analysis, we used only the mean and standard deviation calculations of each variable. We also created the following two variables:

Subject_ID - the Subject's ID used in the experiment

Activity - the activity performed during the recorded observation, including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. 

Finally, all variables dispalyed in the output dataset, 'final_inertia_data.txt', contain the simple mean of the observed values for each subject and activity. For example, the tBodyACC-X.mean variable is equal to the mean of the tBoddyACC-X.mean observations for the specified subject and activity.

##Data Transformations
The analysis was performed in the following steps:

1 - Check to see if the reshape2 and stringr packages are installed. If not, install the packages and then load them.

2 - Read activity labels and features files into R. This step includes re-naming certain variables and dropping unnecessary variables.

3 - Read in all the test subject files, including the measures, activities, and subject IDs. This is in preparation for the data merge.

4 - Bind the subject ID and activities to the measures dataset.

5 - Establish data source variable for the test subjects. 

6 - Only keep necessary variables (Subject and Activity IDs, mean, std dev.) from the dataset.

7 - Repeat steps 3-6 for the Training subject files.

8 - Combine test and train data using the rbind function.

9 - Merge the combined test and train data set with activity descriptions. This data frame created in step 9 is the data table represented in step 4 of the class project description.

10 - Transform the data using a melt function to obtain a row for every measurement by Subject ID and activity.

11 -  Calculate mean for each variable, subject, and activity using the dcast function.

12 - Create the final tidy data set as described in step 5 of the project assignment using various clean-up procedures.

13 - Write final table to output as 'final_inertia_data.txt'.




