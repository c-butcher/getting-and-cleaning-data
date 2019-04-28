library(curl)
library(dplyr)
library(tidyr)

source("fetch.R")

# Start by downloading and unzipping the data files.
# This function is stored in the fetch.R source file.
fetch.data()

# We are fetching our X (measurements) columns
measurements <- fetch.tables(file.path("data", "X_train.txt"),
                             file.path("data", "X_test.txt"))

# Then we fetch our Y (activities) columns
activities <- fetch.tables(file.path("data", "y_train.txt"),
                           file.path("data", "y_test.txt"),
                           labels = c('Activity'))

# And finally we fetch our subjects (identifier) columns
subjects <- fetch.tables(file.path("data", "subject_train.txt"),
                         file.path("data", "subject_test.txt"),
                         labels = c('Subject'))

# Next we label our measurements with their descriptive variable names.
names(measurements) <- fetch.features()

# Here we are combining are subject, activity, and measurement columns.
data <- cbind(subjects, activities, measurements)

# Then we are removing the data frames that we no longer need.
# Garbage cleanup is important, especially when working with
# large data sets.
rm(subjects, activities, measurements)

# It seems that there were duplicate columns in the data-set.
# So we are going ahead and removing those duplicate columns.
data <- data[!duplicated(names(data))]

# Then we are selecting only the columns that we want. Specically
# the Subject, Activity, and Mean/Std columns.
data <- data %>%
          select(Subject, Activity, grep("[Mm]ean|[Ss]td", names(data))) %>%
          cbind

# Next we want to change the activity values from numeric, to their
# text descriptions. First we need to load the activity labels.
activity_labels <- read.table(file.path("data", "activity_labels.txt"),
                              col.names=c('id', 'name'))

# Then we can convert the Activity column into a factor, with the
# levels as the numeric value, and the labels as the text value.
data$Activity <- factor(data$Activity,
                        levels = activity_labels$id,
                        labels = activity_labels$name)

# Finally we group our data by Subject and Activity, then we
# summarize all the columns by their mean/average.
data_summary <- data %>%
                  group_by(Subject, Activity) %>%
                  summarize_all(mean)

# Then we save the file and we're done!
savePath <- file.path("subject_averages.txt")
write.table(data_summary, savePath, row.names = FALSE)
