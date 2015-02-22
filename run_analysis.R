
#set working directory to the folder where data is saved

setwd('C:\Users\chengz2\Downloads\Coursera - Getting and Cleansing Data\UCI HAR Dataset')

#read in all the necessary data files

x.train = read.table('./train/x_train.txt', header = FALSE)
y.train = read.table('./train/y_train.txt', header = FALSE)
subject.train = read.table('./train/subject_train.txt', header=FALSE)
activity.labels = read.table('./activity_labels.txt',header=FALSE)
features   = read.table('./features.txt',header=FALSE)
x.test = read.table('./test/x_test.txt', header = FALSE)
y.test = read.table('./test/y_test.txt', header = FALSE)
subject.test = read.table('./test/subject_test.txt', header=FALSE)

#assign variable names to the data compoments themself

names(x.train) <- features$V2
names(y.train) <- "activity_id"
names(subject.train) <- "subject"
names(x.test) <- features$V2
names(y.test) <- "activity_id"
names(subject.test) <- "subject"

#combine seperate data sets to get the full training and test sets

train.full <- cbind(x.train, y.train, subject.train)
test.full <- cbind(x.test, y.test, subject.test)

#task1 - Merges the training and the test sets to create one data set.

final.full <- rbind(train.full, test.full)

#task2 - Extracts only the measurements on the mean and standard deviation for each measurement. 

final.subset <- final.full[,grep("mean\\(\\)|std\\(\\)|subject|activity", names(final.full))]

#task3 - Uses descriptive activity names to name the activities in the data set

names(activity.labels)<- c("activity_id","activity")
final.data = merge(final.subset, activity.labels, by='activity_id',all.x=TRUE)

# reorder the columns in final data set, put three categorical variables at first

final.data <- cbind(final.data[,c("subject","activity","activity_id")],final.data[,!(names(final.data) %in% c("subject","activity","activity_id"))]) 

#task4 - Appropriately labels the data set with descriptive variable names. 

names(final.data)<-gsub("^t", "time", names(final.data))
names(final.data)<-gsub("^f", "frequency", names(final.data))
names(final.data)<-gsub("Acc", "Accelerometer", names(final.data))
names(final.data)<-gsub("Gyro", "Gyroscope", names(final.data))
names(final.data)<-gsub("Mag", "Magnitude", names(final.data))
names(final.data)<-gsub("BodyBody", "Body", names(final.data))


#task5 - creates a second, independent tidy data set with the average of each variable for each activity and each subject.

summarydata <- aggregate(.~ subject + activity_id + activity, final.data, mean)
write.table(summarydata, file = "summarydata.txt",row.name=FALSE)




