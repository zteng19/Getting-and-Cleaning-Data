#R Code for assignment 2

#Step 1 Combining X and Y test and training data set
x_train<- read.table("UCI HAR Dataset/train/X_train.txt")
y_train<- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

x_test<- read.table("UCI HAR Dataset/test/X_test.txt")
y_test<- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<- read.table("UCI HAR Dataset/test/subject_test.txt") 

#Appending x, y, and subject data sets together.
x_data<- rbind(x_train, x_test)
y_data<- rbind(y_train, y_test)
subject<- rbind(subject_train,subject_test)


#Step 2: Getting only the means and std for the data
features<- read.table("UCI HAR Dataset/features.txt")
mean_and_std<- grep("-(mean|std)\\(\\)", features[,2])
x_data<- x_data[,mean_and_std]

#Descriptive labelling of variables of x
names(x_data)<- features[mean_and_std,2]


#Step 3: using descriptive activity names to name activities in data set
activity<- read.table("UCI HAR Dataset/activity_labels.txt")
y_data[,1]<- activity[y_data[, 1], 2]
names(y_data)<- "activity"

#Step 4 relabling the variable names of subject
names(subject)<- "subject"

#Combining all 3 data sets together
combined_data<- cbind(x_data,subject, y_data)

#Step 5: creating second independent data set with average of each variable for each activity and each subject
library(plyr)
averaged_data <- ddply(combined_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

#Writing Output to txt file
write.table(averaged_data,"averaged_data.txt",row.name = FALSE )


