### Set the working directory
setwd("C:/Users/saalbers/Desktop/UCI HAR Dataset")


### Load features
labels = read.table("features.txt")


### Load data sets
X_train = read.table("train/X_train.txt", col.names = labels[,2])
y_train = read.table("train/y_train.txt", col.names = "Activity")
subject_train = read.table("train/subject_train.txt", col.names = "Subject")

X_test = read.table("test/X_test.txt", col.names = labels[,2])
y_test = read.table("test/y_test.txt", col.names = "Activity")
subject_test = read.table("test/subject_test.txt", col.names = "Subject")


### Select only the mean() and std() measurements
labels_needed = sort(c(grep(pattern = "mean()", labels[,2], fixed = T),
                       grep(pattern = "std()", labels[,2], fixed = T)))

X_train = X_train[,labels_needed]
X_test = X_test[,labels_needed]


### Combine data to obtain one training and test set 
train_set = cbind(subject_train, X_train, y_train)
test_set = cbind(subject_test, X_test, y_test)

merged_data = rbind(train_set,test_set)

### Label the activities
library(plyr)
activities = read.table("activity_labels.txt")
merged_data$Activity = mapvalues(merged_data$Activity, activities[,1], levels(activities[,2]))


### Obtain data grouped by subject and activity
tidy_data = group_by(merged_data, Subject, Activity) %>% summarise_each(funs(mean))

### Save data as txt file
write.table(tidy_data, "TidyData.txt")