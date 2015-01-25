# change to directory
setwd("~/Classes/DSS/03_Getting_and_Cleaning_Data/Course_Project")

## READ HEADER FILES
features <- read.table("data/UCI HAR Dataset/features.txt")

activity.labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")
names(activity.labels) <- c("activity_code", "activity_desc")

## READ TRAINING DATA
# read subject column
subject.train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
names(subject.train) <- "Subject"

# read data
x.train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
colnames(x.train) <- features$V2

# read activity id
y.train <- read.table("data/UCI HAR Dataset/train/Y_train.txt")
names(y.train) <- "activity_code"

# join columns into single frame
train <- cbind(Treatment = "train", subject.train, y.train, x.train)


## READ TEST DATA
# read subject column
subject.test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
names(subject.test) <- "Subject"

# read data
x.test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
colnames(x.test) <- features$V2

# read activity id
y.test <- read.table("data/UCI HAR Dataset/test/Y_test.txt")
colnames(y.test) <- "activity_code"

# join columns into single frame
test <- cbind(Treatment = "test", subject.test, y.test, x.test)

## Append test data to train data
all.data <- rbind(test, train)

## add descriptive activity label names
library(dplyr)
all.data <- inner_join(all.data, activity.labels)

## keep only avg and mean columns
final.data <- cbind(all.data[,c(1,2,565)], all.data[ ,grepl("mean[^Freq]()|std()", names(all.data))])

## Export data
write.table(final.data, "course_project.txt",row.name=FALSE)

## create summarized data set
summary <- final.data %>%
  group_by(Subject, activity_desc) %>%
  summarise_each(funs(mean), 4:69)

# export summary data
write.table(summary, "summary.txt",row.name=FALSE)


