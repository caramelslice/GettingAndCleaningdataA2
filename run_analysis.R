## setwd("/Users/caramel-slice/Dropbox/data/coursera/GC/A2") 
## set the directory to the directory that contains run_analysis.R
## source("run_analysis.R")

###################################Merges the training and the test sets to create one data set.
## Read all files into memory 
## Note that I've removed the space in the folder name
features = read.table("./UCIHARDataset/features.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 561)
X_train = read.table("./UCIHARDataset/train/X_train.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 7352)
X_test = read.table("./UCIHARDataset/test/X_test.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 2947)

subject_test = read.table("./UCIHARDataset/test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 2947)
subject_train = read.table("./UCIHARDataset/train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 7352)

y_test = read.table("./UCIHARDataset/test/y_test.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 2947)
y_train = read.table("./UCIHARDataset/train/y_train.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 7352)

features_trans = t(features)
##binding the first column 
rowbind <- rbind(X_train, X_test, row.names = NULL)
colnames(rowbind) <- features_trans[2,]
## dim(rowbinds) is  10299(7352+2947)   561
##binding the second column 
rowbind2 <- rbind(subject_train, subject_test, row.names = NULL)
colbind <- cbind(rowbind2, rowbind)
## rename the scond column to subject so it makes more sense
colnames(colbind)[1] <- "subject"
# 
# ##binding the third column 
rowbind3 <- rbind(y_train, y_test, row.names = NULL)
colbind2 <- cbind(rowbind3, colbind)
# ## rename the third column to subject so it makes more sense
colnames(colbind2)[1] <- "activity"
# 
# # ## Merge the dataframe with activity_labels.txt
activity_labels = read.table("./UCIHARDataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 561)
merge = merge(activity_labels, colbind2, by.x="V1", by.y="activity", all=TRUE)
colnames(merge)[1] <- "activity"
colnames(merge)[2] <- "activityDesc"


 
# ################################### Extracts only the measurements on the mean and standard deviation for each measurement. 
colname_means<-grep("mean()",colnames(merge),fixed=TRUE)

colname_sds<-grep("std()",colnames(merge),fixed=TRUE)
# select(merge, subject,activitytype, activity, )

merge <- cbind(merge[,1:3], merge[,colname_means], merge[,colname_sds])

# ################################### Uses descriptive activity names to name the activities in the data set
# ### This step is completed in the above while merging the dataframe with activity_labels.txt
 
# ################################### Appropriately labels the data set with descriptive variable names. 
# ##Codebook '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
 
colnames(merge)<-gsub("^t", "Time", colnames(merge)) ##These time domain signals (prefix 't' to denote time)
colnames(merge)<-gsub("Acc", "Acceleration", colnames(merge)) 
colnames(merge)<-gsub("Mag", "Magnitude", colnames(merge)) 
colnames(merge)<-gsub("Gyro", "Gyroscope", colnames(merge)) 
colnames(merge)<-gsub("^f", "Frequency", colnames(merge)) 
colnames(merge)<-gsub("mean()", "Mean", colnames(merge)) 
colnames(merge)<-gsub("std()", "SD", colnames(merge)) 
# 
# ################################### From the data set in step 4, creates a second, 
# ################################### independent tidy data set with the average of each variable for each activity 
# ################################### and each subject.
## Melt and reshape the dataset
library(reshape2)
meltMerge<-melt(merge, id=c("activity", "activityDesc", "subject"), measure.vars=colnames(merge)[-(1:3)])
final<-dcast(meltMerge, activity + activityDesc + subject ~ variable, mean)
write.table(final, "finaltidy.txt", sep="\t", row.name=FALSE)