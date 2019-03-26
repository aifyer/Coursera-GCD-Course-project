
library(dplyr)
library(tidyr)

# Coursera "Getting and cleaning data" - Course project submission, Dan James 26/3/19

# Load master/reference data
features <- read.table("data/features.txt",stringsAsFactors = FALSE,header = FALSE)
activities <- read.table("data/activity_labels.txt")

# Training set
#########################################

# x_train.txt contains the measurement data
x_train <- read.table("data/train/X_train.txt",stringsAsFactors = FALSE, header = FALSE) 
colnames(x_train) <- features[,2] # Assign feature names as column names

# trainData is the data frame that will be built up to include all training measurements with joined data 
# (subject, activity name)
trainData <- x_train

# y_train.txt contains the activity ID's for each measurement row
y_train <- read.table("data/train/Y_train.txt",stringsAsFactors = FALSE, header = FALSE) 

# Create a vector of the activity names, based on activity_id looking up the name/label from 'activities'.
# Add as column 'activity_name' to trainData.
activityNames_train <- sapply(y_train[,1], function(x) { activities[activities$V1 == x,2] } )
trainData <- cbind(activity_name = activityNames_train, trainData)

# subject_train.txt contains the subject ID's for each measurement row
# Add as column 'subject_id' to trainData.
subject_train <- read.table("data/train/subject_train.txt",stringsAsFactors = FALSE, header = FALSE)
names(subject_train)[1] <- "subject_id"
trainData <- cbind(subject_train,trainData)

# TEST SET
#########################################

# The loading/processing of the test data is the same process as the training data. This has
# not been generalized into a single function to account for any slight differences in processing/cleaning
# requirements, if they arise.

# x_test.txt contains the measurement data
x_test <- read.table("data/test/X_test.txt",stringsAsFactors = FALSE, header = FALSE) 
colnames(x_test) <- features[,2] # Assign feature names as column names

# testData is the data frame that will be built up to include all training measurements with joined data 
# (subject, activity name)
testData <- x_test

# y_test.txt contains the activity ID's for each measurement row
y_test <- read.table("data/test/Y_test.txt",stringsAsFactors = FALSE, header = FALSE) 

# Create a vector of the activity names, based on activity_id looking up the name/label from 'activities'.
# Add as column 'activity_name' to testData.
activityNames_test <- sapply(y_test[,1], function(x) { activities[activities$V1 == x,2] } )
testData <- cbind(activity_name = activityNames_test, testData)

# subject_test.txt contains the subject ID's for each measurement row
# Add as column 'subject_id' to trainData.
subject_test <- read.table("data/test/subject_test.txt",stringsAsFactors = FALSE, header = FALSE)
names(subject_test)[1] <- "subject_id"
testData <- cbind(subject_test,testData)


# COMBINED DATASET
#########################################

# Combine training and test data into 'combinedDataSet'
combinedDataSet <- rbind(trainData,testData)

# Create logical vector indicating which columns are of interest (containing 'mean' or 'std') 
columnsOfInterest <- grepl("-mean\\(\\)",colnames(combinedDataSet)) | grepl("-std\\(\\)",colnames(combinedDataSet))
# Also ensure first 3 columns (datasource, subject and activity) are included
columnsOfInterest[1:3] <- TRUE
# Adjust combinedDataSet to only keep relevant columns
combinedDataSet <- combinedDataSet[,columnsOfInterest]

averagedDataSet <- combinedDataSet %>% group_by(subject_id,activity_name) %>% summarise_all(funs(mean))

View(averagedDataSet)
