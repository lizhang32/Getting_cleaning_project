The R script, **run\_analysis.R**, does the following:

-   load library dplyr into R
-   create a directory named project3 under current working directory if
    not existed. Download the data file to the directory project3 and
    unzip it.
-   define the path of the downloaded and unzipped files
-   read the training data, test data, training activity, test training
    activity, training subject and test subject into R
-   read the activity label into R
-   read the measurement variables into R
-   merge the training and test data files and name the merged file as
    data file
-   merge the training and test activity files and name the merged file
    as activity
-   merge the training and test subject files and name the merged file
    as subject
-   assign the column names to subject file, activity files and data
    files
-   merge the training and test sets to create one data set
-   extract only the measurements on the mean and standard deviation for
    each measurement and create Data1 \*uses descriptive activity names
    to name the activities in the data set
-   appropriately labels the data set with descriptive variable names
-   create a second, independent tidy data set (tidy\_Data2) with the
    average of each variable for each activity and each subject
