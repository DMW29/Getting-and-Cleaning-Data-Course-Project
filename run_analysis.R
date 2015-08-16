## Intro
## ----------------------------------------------------------------------------
## Reference material describing file contents is 'README.txt located at https:
## //d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Reference material describing the experiment by which data were collecte as 
## well as the set of variables estimated is features_info.txt ocated at https:
## //d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## ----------------------------------------------------------------------------
## Load the necessary librarys to run the analysis
## ----------------------------------------------------------------------------
if (!require("data.table")) {
        install.packages("data.table")
}

if (!require("reshape2")) {
        install.packages("reshape2")
}

if (!require("sqldf")){
        install.packages("sqldf")
}

if (!require("dplyr")){
        install.packages("dplyr")
}

require("data.table")
require("reshape2")
require("sqldf")
require("dplyr")
## ----------------------------------------------------------------------------
## Loading and joining the data sets.
## ----------------------------------------------------------------------------
## Load activity labels. 'activity_labels.txt' is a vertically oriented file
## with two columns, v1 and v2. The activities WALKING, WALKING UPSTAIRS, WALKING 
## DOWNSTAIRS, SITTING, STANDING, and LAYING are associated with y_train and
## y_test files throughf v1. Therefore, v1 is used later to join the 
## to y_train and y_test to include descriptive names and make the data tidy.
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Load y_train and check the column names.
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

## Join activity labels to ytrain to give the data more descriptive names and 
## name the columns of the result dataframe. Make sure the order stays the same
## by putting ytrain first in the sequence of tables. Maintaining order of 
## y_train (and y_test) is important with these sets of data because not all of
## them have common columns on which to link. It is unnecessary to specify the
## columns on which to join activity_labels and y_train as both contain the 
## column v1 which is the correct common column as verified by names() and is
## the default behaviour to join on common column names.
ytrainlab <- left_join(ytrain, activity_labels)
names(ytrainlab) <- c("activity_id", "activity_label")

## Load y_test and check the column names.
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Join activity labels to ytest to give the data more descriptive names and 
## name the columns.
ytestlab <- left_join(ytest, activity_labels)
names(ytestlab) <- c("activity_id", "activity_label")

## Load feature variable names. 'features.txt' is vertically oriented dataset
## with two columns v1 and v2. The features are associated with the 
## measurements contained in X_train and X_test. The features will replace the 
## column names in these two files to give them more descriptive names to make
## a tidy dataset.
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

## Read in X_train and apply feature names. 'x_train.txt' is the file 
## containing the measurements for the training dataset.
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(xtrain) <- features

## Read in X_test and apply feature names. 'x_test.txt' is the file 
## containing the measurements for the test dataset.
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(xtest) <- features
## ----------------------------------------------------------------------------
## Pull together the entire dataset the results of which will provide the base
## dataset upon which to perform multiple analyses.

## Bring in the subjects for the training data. The subjects will remain 
## anonymous and will remain values from 1:30.
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subjecttrain) <- c("subject")

## Bring in the subjects for the test data. The subjects will remain 
## anonymous and will remain values from 1:30.
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subjecttest) <- c("subject")

## Create the training dataset to include subjects, activity levels, and named
## variables. It is assumed that the order of the datasets match to build a
## comprehensive dataset as there are no common columns on which to match.
traindata <- cbind.data.frame(subjecttrain, ytrainlab, xtrain)

## Create the test dataset to include subjects, activity levels, and named
## variables. It is assumed that the order of the datasets match to build a
## comprehensive dataset as there are no common columns on which to match.
testdata <- cbind.data.frame(subjecttest, ytestlab, xtest)

## Ta-Da! Create the full dataset for future analysis if needed.
expdata <- rbind.data.frame(traindata, testdata)

## Subset expdata to include only those columns with mean and std in their name.
tidyvars <- grep("[Mm]ean|[Ss]td", names(expdata), value = TRUE)
tidy <- expdata[,c("subject", "activity_label", tidyvars)]

## Summarize the data to calculate the means of each variable by subject and 
## activity
tidymelt <- melt(tidy, id=c("subject", "activity_label"), measure.vars = tidyvars)
subact <- dcast(tidymelt, subject + activity_label ~ variable, mean)

## Write the summarized tidy data set to disc.
write.table(subact, file = "./tidydata.txt", row.names = FALSE)
