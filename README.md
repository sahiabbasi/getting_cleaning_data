# getting_cleaning_data
https://class.coursera.org/getdata-015/

Download and unzip the data for the project into the working directory of R Stuio:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The code assume you have the data files needed in the "UCI HAR Dataset" directory of your working directory

Step 1. Merges the training and the test sets to create one data set.
Read features, subject and activity training and test files into a table using read.table
Combine train and test data read from features, subject and activity files to create one data set

Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Read the features into a table from "UCI HAR Dataset/features.txt"
Now we need to find “mean()” or “std()” indices that we are interested in
Get the selected features using the corresponding indices 

Step 3. Uses descriptive activity names to name the activities in the data set
read the activity labels from the corresponding file "UCI HAR Dataset/activity_labels.txt"
label the date to name the activities

Step 4. Appropriately labels the data set with descriptive variable names.
combine the subject, activity and features tables by column to produce find data set

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
we will use the plyr library to agregate the final data mean from step 4 by subject and activity
put the data in order  and write it to file = "UCI_cleaned_data.txt", with row.name=FALSE under the working directory
