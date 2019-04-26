## Codebook

# Sources
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

### Helper Functions
There are a few helper functions that are used to keep the code cleaner, and to avoid repeating function calls. These functions are in the `fetch.R` source file, and mostly retrieve data from the web or file system.

| Function Name                    | Description                                                                                                                         |
|----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| fetch.data()                     | This downloads the zip file from the web, and extracts the data files into the 'data' directory.                                    |
| fetch.tables(file_one, file_two) | Loads two table files and merges the rows together. If you supply the labels, then it will assign those labels to the column names. |
| fetch.features()                 | Loads the feature names, and modifies them to be more human readable.                                                               |
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
