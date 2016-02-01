
Introduction
------------

One of the most exciting areas in all of data science right now is
wearable computing - see for example this article . Companies like
Fitbit, Nike, and Jawbone Up are racing to develop the most advanced
algorithms to attract new users. The data linked to from the course
website represent data collected from the accelerometers from the
Samsung Galaxy S smartphone. A full description is available at the site
where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

please run script run\_analysis.R to process data

Data
----

The data for this assignment can be downloaded from the course web site:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Processing
----------

Data was processed with below step:

-   Dowloading data from website and unzip
-   Read data
-   Merge data by rows
-   Namming the coloumn
-   Merge all data in to 1 dataset
-   Extracts only the measurements on the mean and standard deviation
    for each measurement.
-   Uses descriptive activity names to name the activities in the data
    set
-   Appropriately labels the data set with descriptive variable names.
-   Creates a second, independent tidy data set with the average of each
    variable for each activity and each subject

The variables included in this tidy dataset are:
------------------------------------------------

-   subjectId
-   activity
-   timeBodyAccelerometerMagnitudeMean
-   timeBodyAccelerometerMagnitudeStdDev
-   timeGravityAccelerometerMagnitudeMean
-   timeGravityAccelerometerMagnitudeStdDev
-   timeBodyAccJerkMagnitudeMean
-   timeBodyAccJerkMagnitudeStdDev
-   timeBodyGyroscopeMagMean
-   timeBodyGyroscopeMagStdDev
-   timeBodyGyroscopeJerkMagnitudeMean
-   timeBodyGyroscopeJerkMagnitudeStdDev
-   freqBodyAccelerometerMagnitudeMean
-   freqBodyAccelerometerMagnitudeStdDev
-   freqBodyAccJerkMagnitudeMean
-   freqBodyAccJerkMagnitudeStdDev
-   freqBodyGyroscopeMagMean
-   freqBodyGyroscopeMagStdDev
-   freqBodyGyroscopeJerkMagnitudeMean
-   freqBodyGyroscopeJerkMagnitudeStdDev

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix 't' to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:

mean(): Mean value std(): Standard deviation mad(): Median absolute
deviation max(): Largest value in array min(): Smallest value in array
sma(): Signal magnitude area energy(): Energy measure. Sum of the
squares divided by the number of values. iqr(): Interquartile range
entropy(): Signal entropy arCoeff(): Autorregresion coefficients with
Burg order equal to 4 correlation(): correlation coefficient between two
signals maxInds(): index of the frequency component with largest
magnitude meanFreq(): Weighted average of the frequency components to
obtain a mean frequency skewness(): skewness of the frequency domain
signal kurtosis(): kurtosis of the frequency domain signal
bandsEnergy(): Energy of a frequency interval within the 64 bins of the
FFT of each window. angle(): Angle between to vectors.
