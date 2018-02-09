
library("data.table")
library("dplyr")
library("tidyr")

setwd("C:/Users/acer/Documents/UCI HAR Dataset/")

# 1. Merges the training and the test sets to create one data set.
#train data
subject_train <- read.table("./train/subject_train.txt",header=FALSE) #imports subject_train.txt
x_train       <- read.table("./train/x_train.txt",header=FALSE) #imports x_train.txt
y_train       <- read.table("./train/y_train.txt",header=FALSE) #imports y_train.txt

#test data
subject_test  <- read.table("./test/subject_test.txt",header=FALSE) #imports subject_test.txt
x_test        <- read.table("./test/x_test.txt",header=FALSE) #imports x_test.txt
y_test        <- read.table("./test/y_test.txt",header=FALSE) #imports y_test.txt

#merge all
subject_data  <- rbind(subject_train, subject_test)
x_data        <- rbind(x_train, x_test)
y_data        <- rbind(y_train, y_test)

#print(head(all_data))
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features      <- read.table("./features.txt")
mean_and_sd   <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
x_data        <- x_data[,mean_and_sd[,1]]

#print(head(x_data))

# 3. Uses descriptive activity names to name the activities in the data set
activities    <- read.table("./activity_labels.txt")
y_data[, 1]   <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

#print(head(y_data))

# 4. Appropriately labels the data set with descriptive variable names.
colnames(x_data)    <- features[mean_and_sd[,1],2]
names(subject_data) <- "subject"
all_data            <- cbind(x_data, y_data, subject_data)

#print(head(all_data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- tbl_df(all_data) %>% group_by(subject, activity) %>% summarise_all(mean)
#View(tidy_data)
write.table(tidy_data, file = "./tidydata.txt", row.names = FALSE, col.names = TRUE)