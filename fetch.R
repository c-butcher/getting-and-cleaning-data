#----------------------------------------------------
# Fetch Data
#
# This function will create the data directory, fetch
# the data from the web, and then unzip it into the
# data directory.
#----------------------------------------------------
fetch.data <- function() {
  dataPath <- file.path("data")
  zipPath  <- file.path("data", "cell_phone_data.zip")

  if (!file.exists(dataPath)) {
    dir.create(dataPath, recursive = TRUE)
  }

  if (!file.exists(zipPath)) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile=zipPath,
                  method = 'curl')
  }

  unzip(zipPath, exdir = dataPath, junkpaths=TRUE)
}

#----------------------------------------------------
# Fetch Features
#
# This function will load the list of features from
# the file-system, and alter them so they are more
# human readable.
#----------------------------------------------------
fetch.features <- function(features) {
  features <- read.table(file.path("data", "features.txt"), col.names=c("id", "name"))
  features <- features$name

  features <- gsub("\\(\\)", "", features)
  features <- gsub("\\(|\\)|\\,", "-", features)
  features <- gsub("\\-\\-", "-", features)
  features <- gsub("[\\-]$", "", features)

  features <- gsub("std", "Std", features)
  features <- gsub("mean", "Mean", features)
  features <- gsub("angle", "Angle", features)
  features <- gsub("gravity", "Gravity", features)
  features <- gsub("BodyBody", "Body", features)
  features <- gsub("tBodyAcc", "BodyAccelerometerTime", features)
  features <- gsub("tBodyGyro", "BodyGyroscopeTime", features)
  features <- gsub("tGravityAcc", "GravityAccelerometerTime", features)
  features <- gsub("tGravityGyro", "GravityGyroscopeTime", features)
  features <- gsub("fBodyAcc", "BodyAccelerometerFrequency", features)
  features <- gsub("fBodyGyro", "BodyGyroscopeFrequency", features)
  features <- gsub("fGravityAcc", "GravityAccelerometerFrequency", features)
  features <- gsub("fGravityGyro", "GravityGyroscopeFrequency", features)
  features <- gsub("MeanGravityMean", "GravityMean", features)
  features <- gsub("\\-", "", features)

  features <- paste0("Avg", features)

  features
}

#----------------------------------------------------
# Fetch Tables
#
# This function loads and merges two table files on
# their rows. If you supply labels, then it will also
# label the column names.
#----------------------------------------------------
fetch.tables <- function(file_one, file_two, labels = NULL) {
  if (is.null(labels)) {
    tableOne <- read.table(file_one)
    tableTwo <- read.table(file_two)
  } else {
    tableOne <- read.table(file_one, col.names = labels)
    tableTwo <- read.table(file_two, col.names = labels)
  }

  rbind(tableOne, tableTwo)
}
