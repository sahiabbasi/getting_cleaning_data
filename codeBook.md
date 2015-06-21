Download and unzip the data for the project into the working directory of R Stuio: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip The code assume you have the data files needed in the "UCI HAR Dataset" directory of your working directory


==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

There are many files available for the train and test data but we will use subject train and test files for this project excercise.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Notes:
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


We have run_analysis.R that does the following
=========================================
Step 1. Merges the training and the test sets to create one data set. Read features, subject and activity training and test files into a table using read.table Combine train and test data read from features, subject and activity files to create one data set

Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. Read the features into a table from "UCI HAR Dataset/features.txt" Now we need to find “mean()” or “std()” indices that we are interested in Get the selected features using the corresponding indices

Step 3. Uses descriptive activity names to name the activities in the data set read the activity labels from the corresponding file "UCI HAR Dataset/activity_labels.txt" label the date to name the activities

Step 4. Appropriately labels the data set with descriptive variable names. combine the subject, activity and features tables by column to produce find data set

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. we will use the plyr library to agregate the final data mean from step 4 by subject and activity put the data in order and write it to file = "UCI_cleaned_data.txt", with row.name=FALSE under the working directory
