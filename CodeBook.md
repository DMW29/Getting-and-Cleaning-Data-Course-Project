This document describes the variables, the data, and any transformations or work that I performed to clean up the original data set for this project. The layout of this document is in the following order; Variables, Data, Transformations, and Other separated by dashes (----). The original data set is found here at the following URL. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Download and extract information are contained in README.md in this repository. The principles used to create the output dataset of run_analysis.R are based on the article by Hadley Wickham -> http://vita.had.co.nz/papers/tidy-data.pdf. 

-------------------------------------------------------------------------------

Variables

The list of variables included in the output dataset are a subset of the variables contained in the original dataset found in the link above and are listed below. Basically, any variables with the words mean, Mean, or std contained in their descriptive name are included in the output dataset.  "features.txt" contains the list of variables for the original dataset. "features_info.txt" also inlcuded in the link contains the description and derivation of each of the variables. 

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag-meanFreq()
angle(tBodyAccMean,gravity)
angle(tBodyAccJerkMean),gravityMean)
angle(tBodyGyroMean,gravityMean)
angle(tBodyGyroJerkMean,gravityMean)
angle(X,gravityMean)
angle(Y,gravityMean)
angle(Z,gravityMean)

-------------------------------------------------------------------------------

Data

The datasets used to create the output dataset of run_analysis.R are a subset of the datasets contained in the original dataset found in the link above. Please refer to "README.txt" for a description of the datasets. Listed below are the datasets inlcuded to create the output data set of this project as found after extraction to the home directory.

"~/UCI HAR Dataset/features.txt"
"~/UCI HAR Dataset/actvity_labels.txt"
"~/UCI HAR Dataset/train/X_train.txt"
"~/UCI HAR Dataset/train/y_train.txt"
"~/UCI HAR Dataset/train/subject_train.txt"
"~/UCI HAR Dataset/test/X_test.txt"
"~/UCI HAR Dataset/test/y_test.txt"
"~/UCI HAR Dataset/test/subject_test.txt"

-------------------------------------------------------------------------------

Transformations

y_train.txt and y_test.txt were both joined with activity_labels.txt to replace the number coding for the activity with actual english name of the activity. As described in "README.txt" found in the extracted files from the above link, the activities are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. Tidy datasets have descriptive factor labels.

X_train.txt and X_test.txt were both joined with features.txt to replace the generic variable names (v1, v2, etc.) with descriptive variable names. Tidy datasets have descriptive column names for each variable and each variable lives in it's own column.

subject_train.txt and subject_test.txt where both given the descriptive column name "subject".

subject_train.txt, y_train.txt, and X_train.txt were cbind maintaining the order of the original datasets. This cbind is done under the assumption each row of each dataset represent on observation and are sorted to match these observations together. subject_test.txt, y_test.txt, and X_test.txt were similarly combined. These two actions created two datasets; traindata and testdata.

traindata and testdata were combined by rbind to create expdata which recreates the orignal data with all observational units stored in the same table with each variable living in its own column with descriptive names. 

tidy is created to only contain the variables listed above in the "Variables" section.

subact is create to produce the output file containing the mean of each variable by subject for each activity. This is the output written to "./tidydata.txt" using write.table with row.names = FALSE.

-------------------------------------------------------------------------------

Other

Hadley Wickam also defines a tidy dataset as one were each observational unit is stored in its own table. "tidydata.txt" contains all observational units. This is done to leave options open because from here any number of datasets can be created depending on the focus of the analysis.

