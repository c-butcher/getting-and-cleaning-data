## Codebook

# Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [YouTube](http://www.youtube.com/watch?v=XOEN9W05_4A)

An updated version of this dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions). It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows.

# Source Data
The original data came from the [Human Activity Recognition Using Smart Phones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), but we downloaded the files from a mirror on [Cloudfront](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The archive came with many files, but we only extracted the data from the following:

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

### Modifications to Column Names
- Dropped all columns that weren't a mean or standard deviation.
- Removed the parenthesis "()"
- Removed all dashes "-"
- Capitalized the first character of mean, std, gravity and angle.
- Changed tBodyAcc and tBodyGyro to BodyAccelerometerTime and BodyGyroscopeTime
- Changed fBodyAcc and fBodyGryo to BodyAccelerometerFrequency and BodyGyroscopeFrequency
- Prepended Avg to the beginning of the measurement columns.

```
Subject
Activity
AvgBodyAccelerometerTimeMeanX
AvgBodyAccelerometerTimeMeanY
AvgBodyAccelerometerTimeMeanZ
AvgBodyAccelerometerTimeStdX
AvgBodyAccelerometerTimeStdY
AvgBodyAccelerometerTimeStdZ
AvgGravityAccelerometerTimeMeanX
AvgGravityAccelerometerTimeMeanY
AvgGravityAccelerometerTimeMeanZ
AvgGravityAccelerometerTimeStdX
AvgGravityAccelerometerTimeStdY
AvgGravityAccelerometerTimeStdZ
AvgBodyAccelerometerTimeJerkMeanX
AvgBodyAccelerometerTimeJerkMeanY
AvgBodyAccelerometerTimeJerkMeanZ
AvgBodyAccelerometerTimeJerkStdX
AvgBodyAccelerometerTimeJerkStdY
AvgBodyAccelerometerTimeJerkStdZ
AvgBodyGyroscopeTimeMeanX
AvgBodyGyroscopeTimeMeanY
AvgBodyGyroscopeTimeMeanZ
AvgBodyGyroscopeTimeStdX
AvgBodyGyroscopeTimeStdY
AvgBodyGyroscopeTimeStdZ
AvgBodyGyroscopeTimeJerkMeanX
AvgBodyGyroscopeTimeJerkMeanY
AvgBodyGyroscopeTimeJerkMeanZ
AvgBodyGyroscopeTimeJerkStdX
AvgBodyGyroscopeTimeJerkStdY
AvgBodyGyroscopeTimeJerkStdZ
AvgBodyAccelerometerTimeMagMean
AvgBodyAccelerometerTimeMagStd
AvgGravityAccelerometerTimeMagMean
AvgGravityAccelerometerTimeMagStd
AvgBodyAccelerometerTimeJerkMagMean
AvgBodyAccelerometerTimeJerkMagStd
AvgBodyGyroscopeTimeMagMean
AvgBodyGyroscopeTimeMagStd
AvgBodyGyroscopeTimeJerkMagMean
AvgBodyGyroscopeTimeJerkMagStd
AvgBodyAccelerometerFrequencyMeanX
AvgBodyAccelerometerFrequencyMeanY
AvgBodyAccelerometerFrequencyMeanZ
AvgBodyAccelerometerFrequencyStdX
AvgBodyAccelerometerFrequencyStdY
AvgBodyAccelerometerFrequencyStdZ
AvgBodyAccelerometerFrequencyMeanFreqX
AvgBodyAccelerometerFrequencyMeanFreqY
AvgBodyAccelerometerFrequencyMeanFreqZ
AvgBodyAccelerometerFrequencyJerkMeanX
AvgBodyAccelerometerFrequencyJerkMeanY
AvgBodyAccelerometerFrequencyJerkMeanZ
AvgBodyAccelerometerFrequencyJerkStdX
AvgBodyAccelerometerFrequencyJerkStdY
AvgBodyAccelerometerFrequencyJerkStdZ
AvgBodyAccelerometerFrequencyJerkMeanFreqX
AvgBodyAccelerometerFrequencyJerkMeanFreqY
AvgBodyAccelerometerFrequencyJerkMeanFreqZ
AvgBodyGyroscopeFrequencyMeanX
AvgBodyGyroscopeFrequencyMeanY
AvgBodyGyroscopeFrequencyMeanZ
AvgBodyGyroscopeFrequencyStdX
AvgBodyGyroscopeFrequencyStdY
AvgBodyGyroscopeFrequencyStdZ
AvgBodyGyroscopeFrequencyMeanFreqX
AvgBodyGyroscopeFrequencyMeanFreqY
AvgBodyGyroscopeFrequencyMeanFreqZ
AvgBodyAccelerometerFrequencyMagMean
AvgBodyAccelerometerFrequencyMagStd
AvgBodyAccelerometerFrequencyMagMeanFreq
AvgBodyAccelerometerFrequencyJerkMagMean
AvgBodyAccelerometerFrequencyJerkMagStd
AvgBodyAccelerometerFrequencyJerkMagMeanFreq
AvgBodyGyroscopeFrequencyMagMean
AvgBodyGyroscopeFrequencyMagStd
AvgBodyGyroscopeFrequencyMagMeanFreq
AvgBodyGyroscopeFrequencyJerkMagMean
AvgBodyGyroscopeFrequencyJerkMagStd
AvgBodyGyroscopeFrequencyJerkMagMeanFreq
AvgAngleBodyAccelerometerTimeMeanGravity
AvgAngleBodyAccelerometerTimeJerkMeanGravityMean
AvgAngleBodyGyroscopeTimeMeanGravityMean
AvgAngleBodyGyroscopeTimeJerkMeanGravityMean
AvgAngleXGravityMean
AvgAngleYGravityMean
AvgAngleZGravityMean
```
