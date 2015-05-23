# CodeBook relating to TidyData.txt

### Variables
The data contains the following generic variables:
Subject             ID of the volunteer
Activity            Activity performed by the volunteer with the levels WALKING, WALKING_UPSTAIRS, 
                    WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Also, measurements of signals for the following variables were recorded:
tBodyAcc-XYZ         
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
where -XYZ means that it is split into three variables (for the X, Y and Z direction) and every variable contains a separate column for the mean value and standard deviation.  

### Data source 
UCI HAR Dataset
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
From this zip the following files were used:
activity_labels.txt
features.txt
X_train.txt
y_train.txt
subject_train.txt
X_test.txt
y_test.txt
subject_test.txt

### Actions performed
The following actions were performed to obtain the tidy data set. See the run_analysis.R file for details.
- Load data and label variables 
- Select appropriate columns
- Combine train and test data
- Label activities
- Calculate mean for each variable for each subject and activity_labels
- Save tidy data set as txt file