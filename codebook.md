## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [YouTube](http://www.youtube.com/watch?v=XOEN9W05_4A)

## Source Data
The original data came from the [Human Activity Recognition Using Smart Phones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), but we downloaded the files from a mirror on [Cloudfront](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The archive came with many files, but we only extracted and merged the data from the following:

| File                | Description                                                                                                                                                                                                                            |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| X_train.txt         | The measurements of the accelerometer and gyroscope that came from our subjects phone.                                                                                                                                                 |
| X_test.txt          | The measurements of the accelerometer and gyroscope that came from our subjects phone.                                                                                                                                                 |
| y_train.txt         | The numeric values which represent the type of activity performed by the subject.                                                                                                                                                      |
| y_test.txt          | The numeric values which represent the type of activity performed by the subject.                                                                                                                                                      |
| subject_train.txt   | The numeric identifier of the subject who was carrying the cell phone.                                                                                                                                                                 |
| subject_test.txt    | The numeric identifier of the subject who was carrying the cell phone.                                                                                                                                                                 |
| features.txt        | The column names for the X_train and X_test data sets.                                                                                                                                                                                 |
| activity_labels.txt | The values in the y_train and y_test were numeric, representing the type of activity the subject performed. This file contained the text descriptions of the activity, which matches up to those numeric values in y_train and y_test. |

## Modifications to Data
The original data set had 561 measurement variables (563  if you include the subject and activity identifiers). Our goal was to extract the mean and standard deviation variables from the original data and create a new tidy data set that contained the average measurements of every subjects activities. 

There were 30 subjects in the original study, that performed 6 activities (WALKING, WALKING_UP_STAIRS, WALKING_DOWNSTAIRS, STANDING, SITTING and LAYING). Once we averaged out all of the variables for each subject based on their activities, we were left with 88 variables along 180 observations. 

```
30 subjects x 6 activities = 180 observations
```

The names of the variables were abbreviated, and contained special characters, making them difficult to read. In order to fix this, we made the following changes to the variable names:

- Capitalized the first character of mean, std, gravity and angle.
- Changed tBodyAcc and tBodyGyro to BodyAccelerometerTime and BodyGyroscopeTime
- Changed fBodyAcc and fBodyGryo to BodyAccelerometerFrequency and BodyGyroscopeFrequency
- Prepended Avg to the beginning of the measurement columns.
- Removed the parenthesis "()"
- Removed all dashes "-"

# Extracted Variables
| File | Original Name | Final Name |
|------|---------------|------------|
| subject_train.txt / subject_test.txt | - | Subject |
| y_train.txt / y_test.txt | - | Activity |
| X_train.txt / X_test.txt | tBodyAcc-mean()-X | AvgBodyAccelerometerTimeMeanX |
| X_train.txt / X_test.txt | tBodyAcc-mean()-Y | AvgBodyAccelerometerTimeMeanY |
| X_train.txt / X_test.txt | tBodyAcc-mean()-Z | AvgBodyAccelerometerTimeMeanZ |
| X_train.txt / X_test.txt | tBodyAcc-std()-X | AvgBodyAccelerometerTimeStdX |
| X_train.txt / X_test.txt | tBodyAcc-std()-Y | AvgBodyAccelerometerTimeStdY |
| X_train.txt / X_test.txt | tBodyAcc-std()-Z | AvgBodyAccelerometerTimeStdZ |
| X_train.txt / X_test.txt | tGravityAcc-mean()-X | AvgGravityAccelerometerTimeMeanX |
| X_train.txt / X_test.txt | tGravityAcc-mean()-Y | AvgGravityAccelerometerTimeMeanY |
| X_train.txt / X_test.txt | tGravityAcc-mean()-Z | AvgGravityAccelerometerTimeMeanZ |
| X_train.txt / X_test.txt | tGravityAcc-std()-X | AvgGravityAccelerometerTimeStdX |
| X_train.txt / X_test.txt | tGravityAcc-std()-Y | AvgGravityAccelerometerTimeStdY |
| X_train.txt / X_test.txt | tGravityAcc-std()-Z | AvgGravityAccelerometerTimeStdZ |
| X_train.txt / X_test.txt | tBodyAccJerk-mean()-X | AvgBodyAccelerometerTimeJerkMeanX |
| X_train.txt / X_test.txt | tBodyAccJerk-mean()-Y | AvgBodyAccelerometerTimeJerkMeanY |
| X_train.txt / X_test.txt | tBodyAccJerk-mean()-Z | AvgBodyAccelerometerTimeJerkMeanZ |
| X_train.txt / X_test.txt | tBodyAccJerk-std()-X | AvgBodyAccelerometerTimeJerkStdX |
| X_train.txt / X_test.txt | tBodyAccJerk-std()-Y | AvgBodyAccelerometerTimeJerkStdY |
| X_train.txt / X_test.txt | tBodyAccJerk-std()-Z | AvgBodyAccelerometerTimeJerkStdZ |
| X_train.txt / X_test.txt | tBodyGyro-mean()-X | AvgBodyGyroscopeTimeMeanX |
| X_train.txt / X_test.txt | tBodyGyro-mean()-Y | AvgBodyGyroscopeTimeMeanY |
| X_train.txt / X_test.txt | tBodyGyro-mean()-Z | AvgBodyGyroscopeTimeMeanZ |
| X_train.txt / X_test.txt | tBodyGyro-std()-X | AvgBodyGyroscopeTimeStdX |
| X_train.txt / X_test.txt | tBodyGyro-std()-Y | AvgBodyGyroscopeTimeStdY |
| X_train.txt / X_test.txt | tBodyGyro-std()-Z | AvgBodyGyroscopeTimeStdZ |
| X_train.txt / X_test.txt | tBodyGyroJerk-mean()-X | AvgBodyGyroscopeTimeJerkMeanX |
| X_train.txt / X_test.txt | tBodyGyroJerk-mean()-Y | AvgBodyGyroscopeTimeJerkMeanY |
| X_train.txt / X_test.txt | tBodyGyroJerk-mean()-Z | AvgBodyGyroscopeTimeJerkMeanZ |
| X_train.txt / X_test.txt | tBodyGyroJerk-std()-X | AvgBodyGyroscopeTimeJerkStdX |
| X_train.txt / X_test.txt | tBodyGyroJerk-std()-Y | AvgBodyGyroscopeTimeJerkStdY |
| X_train.txt / X_test.txt | tBodyGyroJerk-std()-Z | AvgBodyGyroscopeTimeJerkStdZ |
| X_train.txt / X_test.txt | tBodyAccMag-mean() | AvgBodyAccelerometerTimeMagMean |
| X_train.txt / X_test.txt | tBodyAccMag-std() | AvgBodyAccelerometerTimeMagStd |
| X_train.txt / X_test.txt | tGravityAccMag-mean() | AvgGravityAccelerometerTimeMagMean |
| X_train.txt / X_test.txt | tGravityAccMag-std() | AvgGravityAccelerometerTimeMagStd |
| X_train.txt / X_test.txt | tBodyAccJerkMag-mean() | AvgBodyAccelerometerTimeJerkMagMean |
| X_train.txt / X_test.txt | tBodyAccJerkMag-std() | AvgBodyAccelerometerTimeJerkMagStd |
| X_train.txt / X_test.txt | tBodyGyroMag-mean() | AvgBodyGyroscopeTimeMagMean |
| X_train.txt / X_test.txt | tBodyGyroMag-std() | AvgBodyGyroscopeTimeMagStd |
| X_train.txt / X_test.txt | tBodyGyroJerkMag-mean() | AvgBodyGyroscopeTimeJerkMagMean |
| X_train.txt / X_test.txt | tBodyGyroJerkMag-std() | AvgBodyGyroscopeTimeJerkMagStd |
| X_train.txt / X_test.txt | fBodyAcc-mean()-X | AvgBodyAccelerometerFrequencyMeanX |
| X_train.txt / X_test.txt | fBodyAcc-mean()-Y | AvgBodyAccelerometerFrequencyMeanY |
| X_train.txt / X_test.txt | fBodyAcc-mean()-Z | AvgBodyAccelerometerFrequencyMeanZ |
| X_train.txt / X_test.txt | fBodyAcc-std()-X | AvgBodyAccelerometerFrequencyStdX |
| X_train.txt / X_test.txt | fBodyAcc-std()-Y | AvgBodyAccelerometerFrequencyStdY |
| X_train.txt / X_test.txt | fBodyAcc-std()-Z | AvgBodyAccelerometerFrequencyStdZ |
| X_train.txt / X_test.txt | fBodyAcc-meanFreq()-X | AvgBodyAccelerometerFrequencyMeanFreqX |
| X_train.txt / X_test.txt | fBodyAcc-meanFreq()-Y | AvgBodyAccelerometerFrequencyMeanFreqY |
| X_train.txt / X_test.txt | fBodyAcc-meanFreq()-Z | AvgBodyAccelerometerFrequencyMeanFreqZ |
| X_train.txt / X_test.txt | fBodyAccJerk-mean()-X | AvgBodyAccelerometerFrequencyJerkMeanX |
| X_train.txt / X_test.txt | fBodyAccJerk-mean()-Y | AvgBodyAccelerometerFrequencyJerkMeanY |
| X_train.txt / X_test.txt | fBodyAccJerk-mean()-Z | AvgBodyAccelerometerFrequencyJerkMeanZ |
| X_train.txt / X_test.txt | fBodyAccJerk-std()-X | AvgBodyAccelerometerFrequencyJerkStdX |
| X_train.txt / X_test.txt | fBodyAccJerk-std()-Y | AvgBodyAccelerometerFrequencyJerkStdY |
| X_train.txt / X_test.txt | fBodyAccJerk-std()-Z | AvgBodyAccelerometerFrequencyJerkStdZ |
| X_train.txt / X_test.txt | fBodyAccJerk-meanFreq()-X | AvgBodyAccelerometerFrequencyJerkMeanFreqX |
| X_train.txt / X_test.txt | fBodyAccJerk-meanFreq()-Y | AvgBodyAccelerometerFrequencyJerkMeanFreqY |
| X_train.txt / X_test.txt | fBodyAccJerk-meanFreq()-Z | AvgBodyAccelerometerFrequencyJerkMeanFreqZ |
| X_train.txt / X_test.txt | fBodyGyro-mean()-X | AvgBodyGyroscopeFrequencyMeanX |
| X_train.txt / X_test.txt | fBodyGyro-mean()-Y | AvgBodyGyroscopeFrequencyMeanY |
| X_train.txt / X_test.txt | fBodyGyro-mean()-Z | AvgBodyGyroscopeFrequencyMeanZ |
| X_train.txt / X_test.txt | fBodyGyro-std()-X | AvgBodyGyroscopeFrequencyStdX |
| X_train.txt / X_test.txt | fBodyGyro-std()-Y | AvgBodyGyroscopeFrequencyStdY |
| X_train.txt / X_test.txt | fBodyGyro-std()-Z | AvgBodyGyroscopeFrequencyStdZ |
| X_train.txt / X_test.txt | fBodyGyro-meanFreq()-X | AvgBodyGyroscopeFrequencyMeanFreqX |
| X_train.txt / X_test.txt | fBodyGyro-meanFreq()-Y | AvgBodyGyroscopeFrequencyMeanFreqY |
| X_train.txt / X_test.txt | fBodyGyro-meanFreq()-Z | AvgBodyGyroscopeFrequencyMeanFreqZ |
| X_train.txt / X_test.txt | fBodyAccMag-mean() | AvgBodyAccelerometerFrequencyMagMean |
| X_train.txt / X_test.txt | fBodyAccMag-std() | AvgBodyAccelerometerFrequencyMagStd |
| X_train.txt / X_test.txt | fBodyAccMag-meanFreq() | AvgBodyAccelerometerFrequencyMagMeanFreq |
| X_train.txt / X_test.txt | fBodyBodyAccJerkMag-mean() | AvgBodyAccelerometerFrequencyJerkMagMean |
| X_train.txt / X_test.txt | fBodyBodyAccJerkMag-std() | AvgBodyAccelerometerFrequencyJerkMagStd |
| X_train.txt / X_test.txt | fBodyBodyAccJerkMag-meanFreq() | AvgBodyAccelerometerFrequencyJerkMagMeanFreq |
| X_train.txt / X_test.txt | fBodyBodyGyroMag-mean() | AvgBodyGyroscopeFrequencyMagMean |
| X_train.txt / X_test.txt | fBodyBodyGyroMag-std() | AvgBodyGyroscopeFrequencyMagStd |
| X_train.txt / X_test.txt | fBodyBodyGyroMag-meanFreq() | AvgBodyGyroscopeFrequencyMagMeanFreq |
| X_train.txt / X_test.txt | fBodyBodyGyroJerkMag-mean() | AvgBodyGyroscopeFrequencyJerkMagMean |
| X_train.txt / X_test.txt | fBodyBodyGyroJerkMag-std() | AvgBodyGyroscopeFrequencyJerkMagStd |
| X_train.txt / X_test.txt | fBodyBodyGyroJerkMag-meanFreq() | AvgBodyGyroscopeFrequencyJerkMagMeanFreq |
| X_train.txt / X_test.txt | angle(tBodyAccMean,gravity) | AvgAngleBodyAccelerometerTimeMeanGravity |
| X_train.txt / X_test.txt | angle(tBodyAccJerkMean),gravityMean) | AvgAngleBodyAccelerometerTimeJerkMeanGravityMean |
| X_train.txt / X_test.txt | angle(tBodyGyroMean,gravityMean) | AvgAngleBodyGyroscopeTimeMeanGravityMean |
| X_train.txt / X_test.txt | angle(tBodyGyroJerkMean,gravityMean) | AvgAngleBodyGyroscopeTimeJerkMeanGravityMean |
| X_train.txt / X_test.txt | angle(X,gravityMean) | AvgAngleXGravityMean |
| X_train.txt / X_test.txt | angle(Y,gravityMean) | AvgAngleYGravityMean |
| X_train.txt / X_test.txt | angle(Z,gravityMean) | AvgAngleZGravityMean |

