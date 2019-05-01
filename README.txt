Getting and Cleaning Data
README.txt


For the assignment in the course we had demonstrate knowledge on data manipulation by deliveriring a tidy data set extracted from the "Human Activity Recognition Using Smartphones" dataset provcided in the assignment instructions.

The files in the rest of the repository consist of:

a) CodeBook.md: which describes the variables, calculations, other relevant information regarding the data manipulation performed in the run_analysis.R file.
b) run_analysis.R: which containg the R script that follows the instructed steps to create the tidy dataset:
     1. Merges the training and the test sets to create one data set.
     2. Extracts only the measurements on the mean and standard deviation for each measurement.
     3. Uses descriptive activity names to name the activities in the data set
     4. Appropriately labels the data set with descriptive variable names.
     5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
c) tidydataset.txt: which contains the tidy dataset, product of the scripts in run_analysis.R
