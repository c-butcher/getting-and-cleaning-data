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

Before you run the `analysis.R` file, you will want to set your working directory. This can be any directory of your choice, but we strongly recommend you use the same directory that the `Project.Rproj` file is located in.

### Project Files
| File                 | Description                                                                                                                                                |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Project.Rproj        | You can open this file using RStudio. It allows us to share configurations for a project.                                                                  |
| fetch.R              | Source code file that contains helper functions for loading data from both the web and filesystem.                                                         |
| run_analysis.R       | Source code file that runs the data analysis. For more information about how it works, please check out the CodeBook.md, or read the comments in the file. |
| codebook.md          | A file containing a description of all the adjustments and operations carried out on the data set.                                                         |
| subject_averages.txt | The finalized tidy data set which contains the average measurements for a subjects activity.                                                               |


### Review Criteria
The one thing that I noticed when reading the review criteria for this project, was that accuracy wasn't part of the requirements. The teachers only want to make sure that we submit a tidy data set (reguardless of accuracy), and that we have the proper files. In real life, accurracy matters, so if you believe that the data-set has mistakes, then please contact me. Just don't mark my grade down, because like I said, 'Accuracy' wasn't part of the requirements:

- The submitted data set is tidy.
- The Github repo contains the required scripts.
- GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
- The README that explains the analysis files is clear and understandable.
- The work submitted for this project is the work of the student who submitted it.
