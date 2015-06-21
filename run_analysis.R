# Here are the data for the project:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



# Step 1. Merges the training and the test sets to create one data set.

#Read features files into a table
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
#Combine train and test features data
featuresTable <- rbind(train, test)

#Read subject files into a table
train <- read.table("UCI HAR Dataset/train/subject_train.txt")
test <- read.table("UCI HAR Dataset/test/subject_test.txt")
#Combine train and test Subject data
subjectTable <- rbind(train, test)

#Read Activiities files into a table
train <- read.table("UCI HAR Dataset/train/y_train.txt")
test <- read.table("UCI HAR Dataset/test/y_test.txt")
#Combine train and test Activities data
activityTable <- rbind(train, test)

# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("UCI HAR Dataset/features.txt")
# get “mean()” or “std()” indices
ms_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
# selected features
featuresTable <- featuresTable[, ms_features]
names(featuresTable) <- features[ms_features, 2]
names(featuresTable) <- gsub("\\(|\\)", "", names(featuresTable))
names(featuresTable) <- tolower(names(featuresTable))

# Step 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
activityTable[,1] = activities[activityTable[,1], 2]
names(activityTable) <- "activity"

# Step 4. Appropriately labels the data set with descriptive variable names.

names(subjectTable) <- "subject"
finalData <- cbind(subjectTable, activityTable, featuresTable)
write.table(finalData, "UCI_data.txt")

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr);
cleaned<-aggregate(. ~subject + activity, finalData, mean)
cleaned<-cleaned[order(cleaned$subject,cleaned$activity),]
write.table(cleaned, file = "UCI_cleaned_data.txt",row.name=FALSE)
