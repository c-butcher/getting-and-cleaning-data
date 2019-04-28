## Getting and Cleaning Data - Course Project

This project is a demonstration of retrieving existing data, cleaning it up and saving it as a new tidy data-set. We will use the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), which has several data files stored in a zipped archive. Our goals are as follows:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- Create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Review Criteria
Below you can see the elaborate criteria on which we are to be judged! You will notice that accuracy in our data calculations was not one of the criteria. Instead we are to be judged on whether we submitted the correct files, and that our documentation is well-written.

- The submitted data set is tidy.
- The Github repo contains the required scripts.
- GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
- The README that explains the analysis files is clear and understandable.
- The work submitted for this project is the work of the student who submitted it.

### Instructions
This analysis requires that you have the `curl`, `dplyr` and `tidr` libraries installed. If you do not have them installed, then you can run the following command:
```r
  install.packages(c('curl', 'dplyr', 'tidr'))
```

If you are using RStudio, then you can open the project file by clicking `File -> Open Project...`, then opening the `Project.Rproj` for this project.

Before you run the `analysis.R` file, you will want to set your working directory. The directory must be the same folder that the `analysis.R` file is located in, otherwise it won't be able to load the `fetch.R` file.

### Project Files
| File                 | Description                                                                                                                                                |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| fetch.R              | Source code file that contains helper functions for loading data from both the web and filesystem.                                                         |
| run_analysis.R       | Source code file that runs the data analysis. For more information about how it works, please check out the codebook.md, or read the comments in the file. |
| codebook.md          | A file containing a description of all the adjustments and operations carried out on the data set.                                                         |
| subject_averages.txt | The finalized tidy data set which contains the average measurements for a subjects activity.                                                               |

### Helper Functions
There are a few helper functions that are used to keep the code cleaner, and to avoid repeating function calls. These functions are in the `fetch.R` source file, and mostly retrieve data from the web or file system.

| Function Name                    | Description                                                                                                                         |
|----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| fetch.data()                     | This downloads the zip file from the web, and extracts the data files into the 'data' directory.                                    |
| fetch.tables(file_one, file_two) | Loads two table files and merges the rows together. If you supply the labels, then it will assign those labels to the column names. |
| fetch.features()                 | Loads the feature names, and modifies them to be more human readable.                                                               |
