## Getting and Cleaning Data - Course Project

This project is a demonstration of retrieving existing data, cleaning it up and saving it as a new tidy data-set. We will use the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), which has several data files stored in a zipped archive. Our goals are as follows:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- Create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Instructions
This analysis requires that you have the `curl`, `dplyr` and `tidr` libraries installed. If you do not have them installed, then you can run the following command:
```r
  install.packages(c('curl', 'dplyr', 'tidr'))
```

If you are using RStudio, then you can open the project file by clicking `File -> Open Project...`, then opening the `Project.Rproj` for this project.

Before you run the `analysis.R` file, you will want to set your working directory. The directory must be the same folder that the `analysis.R` file is located in, otherwise it won't be able to load the `fetch.R` file.

### Script Process
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

### Project Files
| File                 | Description                                                                                                                                                |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| fetch.R              | Source code file that contains helper functions for loading data from both the web and filesystem.                                                         |
| run_analysis.R       | Source code file that runs the data analysis. For more information about how it works, please check out the codebook.md, or read the comments in the file. |
| codebook.md          | A file containing a description of all the adjustments and operations carried out on the data set.                                                         |
| subject_averages.txt | The finalized tidy data set which contains the average measurements for a subjects activity.                                                               |

### Helper Functions
There are a few helper functions that are used to keep the code cleaner and to avoid repeating function calls. These functions are in the `fetch.R` source file, and mostly retrieve data from the web or file system.

| Function Name                    | Description                                                                                                                         |
|----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| fetch.data()                     | This downloads the zip file from the web, and extracts the data files into the 'data' directory.                                    |
| fetch.tables(file_one, file_two) | Loads two table files and merges the rows together. If you supply the labels, then it will assign those labels to the column names. |
| fetch.features()                 | Loads the feature names, and modifies them to be more human readable.                                                               |
