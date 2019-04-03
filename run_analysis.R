library(dplyr)
if(!file.exists("./project3")){dir.create("./project3")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./project3/Dataset.zip", method="curl")
unzip(zipfile="./project3/Dataset.zip", exdir='./project3')
path_project3<-file.path("./project3", "UCI HAR Dataset")
data_test<-read.table(file.path(path_project3, "test", "X_test.txt"), header=FALSE)
data_train<-read.table(file.path(path_project3, "train", "X_train.txt"), header=FALSE)
data_activity_test<-read.table(file.path(path_project3, "test", "y_test.txt"), header=FALSE)
data_activity_train<-read.table(file.path(path_project3, "train", "y_train.txt"), header=FALSE)
data_subject_test<-read.table(file.path(path_project3, "test","subject_test.txt"), header=FALSE)
data_subject_train<-read.table(file.path(path_project3, "train","subject_train.txt"), header=FALSE)
activity_labels<-read.table(file.path(path_project3, "activity_labels.txt"))
features<-read.table(file.path(path_project3, "features.txt"))

data<-rbind(data_test, data_train)
activity<-rbind(data_activity_test, data_activity_train)
subject<-rbind(data_subject_test, data_subject_train)
colnames(subject)<-"subject"
colnames(activity)<-"activity"
colnames(data)<-features[, 2]
data1<-cbind(activity, subject)
data2<-cbind(data, data1)






Data<-data2[, !duplicated(colnames(data2))]
Data1<-select(Data, "subject", "activity", contains("mean"), contains("std"))
Data1$activity<-as.character(Data1$activity)


Data1$activity<-gsub("1", activity_labels[,2][1], Data1$activity)
Data1$activity<-gsub("2", activity_labels[,2][2], Data1$activity)
Data1$activity<-gsub("3", activity_labels[,2][3], Data1$activity)
Data1$activity<-gsub("4", activity_labels[,2][4], Data1$activity)
Data1$activity<-gsub("5", activity_labels[,2][5], Data1$activity)
Data1$activity<-gsub("6", activity_labels[,2][6], Data1$activity)

colnames(Data1)<-gsub("^t", "Time", colnames(Data1))
colnames(Data1)<-gsub("Acc", "Accelerometer", colnames(Data1))
colnames(Data1)<-gsub("Gyro", "Gyroscope", colnames(Data1))
colnames(Data1)<-gsub("^f", "Frequency", colnames(Data1))
colnames(Data1)<-gsub("BodyBody", "Body", colnames(Data1))
colnames(Data1)<-gsub("Mag", "Magnitude", colnames(Data1))
colnames(Data1)<-gsub("^t", "Time", colnames(Data1))
colnames(Data1)<-gsub("std", "standarddeviation", colnames(Data1))
colnames(Data1)<-gsub("-","", colnames(Data1))
colnames(Data1)<-gsub("\\(\\)", "", colnames(Data1))


Data2<-Data1%>%group_by(subject, activity)%>% summarise_all(mean)
write.table(Data2, file="./project3/tidy_data2.txt", sep="\t", col.names=TRUE, row.names=FALSE)