Experiment Information
=================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

Variables Information 
=================
"subject" represents the IDs of the participants (30 in total).
"activity" represents the ID of the activity
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAccelerometer-XYZ and Timegyroscope-XYZ. These time domain signals (prefix 'Time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAcceleration-XYZ and TimeGravityAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerationJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerationMagnitude, TimeGravityAcceleration, TimeBodyAccelerationJerkMagnitude, TimeBodyGyroMagnitude, TimeBodyGyroJerkMagnitude). 

Variables start with "Frequency": a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

Mean(): Mean value
Std(): Standard deviation


Summary Choices
=================
All the text files were downloaded from their original sourced 
The files that are necessary to compute the Means and Standard deviations are merged. 
The inertial folders have not included because they are not needed to compute the means and standard deviations.
The means and Standard deviations are calculated based on column names in the features.txt file that include mean() and std() at the end. 
The findal tidy dataset is broken into activity categories and the performance of each participant in each category. 



