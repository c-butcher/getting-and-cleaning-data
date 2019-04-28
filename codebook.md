## Original Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [YouTube](http://www.youtube.com/watch?v=XOEN9W05_4A)

#### Original Data Download
The original data came from the [Human Activity Recognition Using Smart Phones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), but we downloaded the files from a mirror on [Cloudfront](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Extracted Data
There were many files in the original archive, but we only needed to extract information from the following files:

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

### Modifications to Data
The original data set had 561 measurement features (563  if you include the subject and activity identifiers). Our goal was to extract the mean and standard deviation features from the original data and create a new tidy data set that contained the average of every measurement for every activity that the subject performed.

The first step was to load the measurements in the `X_train.txt` and `X_test.txt` files. Then assign the columns their names which were stored in the `features.txt` file. When the column names were loaded, they were also transformed them into human readable names using the following rules:

- Capitalized the first character of mean, std, gravity and angle.
- Changed tBodyAcc and tBodyGyro to BodyAccelerometerTime and BodyGyroscopeTime
- Changed fBodyAcc and fBodyGryo to BodyAccelerometerFrequency and BodyGyroscopeFrequency
- Prepended Avg to the beginning of the column name.
- Removed the parenthesis "()"
- Removed all dashes "-"

Once we had the measurements, the next step was to merge in the subject identifiers that were located in the `subject_train.txt` and `subject_test.txt` files. Then we merged in the activities that were located in the `y_train.txt` and `y_test.txt` files. The activities were numeric based, which was difficult to understand, so we transformed them from their numeric values to their text descriptions that were located in the `features.txt` file.

At this point the data was completely merged, but we only needed the measurements that contained the mean and standard deviations. So we removed all the measurement columns except for the mean and standard deviations. Our first attempt to extract the specific columns failed, because some of the original column names had a capital Mean or Std in their labels, and other had lowercase. So we used a regex expression that looked for both (`[Mm]ean|[Ss]td`) leaving us with 88 columns (including the subject and activity columns).

Our next step was to calculate the average for all measurements of a specific activity on a per subject basis. We did this by grouping the data by subject and then activity before running the mean function on the data set. Since there were 30 subjects in the study, and they eached performed 6 different activities, our calculations left us with 180 observations. (30 subjects * 6 activities == 180 observations).

We then saved our new data set to the `subject_averages.txt` file. In order to verify that the numbers were correct, we extracted the original data for subject one, from when they were performing the walking activity (which was 90 observations). Then we manually calculated the average to make sure it was correct.

### Activities
The activities that were found in the y_train.txt and y_test.txt were numeric, and were later converted to their text descriptions found in the `activity_labels.txt` file. Below is a list that shows the relationship between those numbers and their description.

| Number | Text |
|--------|------|
| 1 | WALKING |
| 2 | WALKING_UPSTAIRS |
| 3 | WALKING_DOWNSTAIRS |
| 4 | SITTING |
| 5 | STANDING |
| 6 | LAYING |


### Extracted Features
| Extracted From | Original Name | Final Name |
|----------------|---------------|------------|
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
| X_train.txt / X_test.txt | angle(tBodyAccJerkMean),gravityMean) | AvgAngleBodyAccelerometerTimeJerkGravityMean |
| X_train.txt / X_test.txt | angle(tBodyGyroMean,gravityMean) | AvgAngleBodyGyroscopeTimeGravityMean |
| X_train.txt / X_test.txt | angle(tBodyGyroJerkMean,gravityMean) | AvgAngleBodyGyroscopeTimeJerkGravityMean |
| X_train.txt / X_test.txt | angle(X,gravityMean) | AvgAngleXGravityMean |
| X_train.txt / X_test.txt | angle(Y,gravityMean) | AvgAngleYGravityMean |
| X_train.txt / X_test.txt | angle(Z,gravityMean) | AvgAngleZGravityMean |
