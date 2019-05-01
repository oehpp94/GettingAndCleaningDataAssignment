Getting and Cleaning Data
CodeBook.md


The run_analysis.R file consists on a series of scripts to manipulate the "Human Activity Recognition Using Smartphones" into a tidy dataset.


Access unzipped assignment folder: 

Scripts under this description simply aid in accessing the proper unzipped folder "UCI HAR Dataset" to access the necessary data files.


Read the data from the target files: 

Scripts under this description read the data in six different files and assign it into six different variables:

    a) activityTestFile: (dataframe, 2947 obs, 1 variable) which contains the data from "Y_test.txt"
    b) activityTrainFile: (dataframe, 7352 obs, 1 variable) which contains the data from "Y_train.txt"
    c) subjectTestFile: (dataframe, 2947 obs, 1 variable) which contains the data from "subject_test.txt"
    d) subjectTrainFile: (dataframe, 7352 obs, 1 variable) which contains the data from "subject_train.txt"
    e) featuresTestFile: (dataframe, 2947 obs, 561 variable) which contains the data from "X_test.txt"
    f) featuresTrainFile: (dataframe, 7352 obs, 561 variable) which contains the data from "X_train.txt"


Merge the training and the test sets to create one data set:

Scripts under this description perform the first task of the assignment by:

    a)Row combining the test observations and train observations per variable
        - subjectDataSet: (dataframe, 10299 obs, 1 variables)
        - activityDataSet: (dataframe, 10299 obs, 1 variables)
        - featuresDataSet: (dataframe, 10299 obs, 561 variables)
    b) Properly labeling the variables, including the features by reading into the "features.txt" file
    c) Column combinding all variable sets into one
        - fullDataSet: (dataframe, 10299 obs, 563 variables)


Extract only the measurements on the mean and standard deviation for each measurement:

Scripts under this description the perform the second task of the assignment by:

    a) Extracting a list of the features-originated column names that contained 'mean' or 'std'
        - meanAndstdCols (factor, 477 levels, 68 length)
    b) Adding this extracted list and the 'subject' and 'activity' variables to create the final list of all desired columns
        - measurmentsCols: (character, 68 length)
    c) Subsetting the columns with the names in the previous list from fullDataSet into a new variable called newDataSet
        - newDataSet: (dataframe, 10299 obs, 68 variables)


Use descriptive activity names to name the activities in the data set

Scripts under this description perform the third task of the assignment by:

    a) Reading into "activity_labels.txt" to extract the activity descriptions
        - activityLabels
    b) Factorizing the activity variable values in newDataSet
    c) Insert activity descriptions as a level to the numeric code that represented them before
        - WALKING: 1
        - WALKING_UPSTAIRS: 2
        - WALKING_DOWNSTAIRS: 3
        - SITTING: 4
        - STANDING: 5
        - LAYING: 6


Appropriately label the data set with descriptive variable names

Scripts under this description perform the fourth task of the assignment by:

    a) Renamming the feature variable names to obtain more comprehensive (tidy) names. To do so the following abbreviations were replaced:
        -"^t" for "Time"
        -"Acc" for "Accelerometer"
        -"Gyro" for "Gyroscope"
        -"Mag" for "Magnitude"
        -"^f", "Frequency"
    b) To standardize, the subject and activity variable columns names had their first letter capitalized
        - Subject
        - Activity


From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject:

Scripts under this description perform the fifth task of the assignment by:

    a) Installing on the dplyr package
    b) Using the aggregate function inside the dplyr package to take the mean of each variable per activity and subject, and save the result into an independent data set
        - newDataSet2: (dataframe, 180 obs, 68 variables)
    c) Ordering the newly created data set by Subject and Activity
    d) Saving this new tidy data set into the "tidydataset.txt" file
