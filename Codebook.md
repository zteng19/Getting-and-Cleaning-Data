Codebook for second assignment
===============================

#Introduction

The R script run_analysis.R contains the data transformation of the original data that is required for the course project. The respective steps are listed as below in their respective order:

-The test and training data set are merged together using the rbind() function.

-Only the variables that contain information about the means and standard deviation of each activity are extracted. The names of the extracted data are then replaced with their descriptive names taken from features.txt.

-The names of the orignal data in the activity data set are also replaced with their descriptive names from activity.txt.

-Finally a second independent data set averaged_data.txt is also created that contains the average for each activity and each subject.


#Description of Variables

-x_train, y_train and subject_train contains the data from the original training set.

-x_test, y_test and subject_test contains the data from the downloaded test set.

-x_data, y_data and subject_data refers to the merged data set of both the training and test set for x, y and subject respectively.

-features and activity contains the decriptive names for x and y respectively.

-combined_data is the merged data set from x_data, y_data and subject

-averaged_data contains the average of each variable of combined_data for each activity and each subject.




