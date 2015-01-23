## setwd("/Users/caramel-slice/Dropbox/data/coursera/GC/A2") 
## set the directory to the directory that contains run_analysis.R
## source("run_analysis.R")
## nrow()
library(plyr)

## Read all files into memory 
# features = read.table("./UCIHARDataset/features.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 561)
# X_train = read.table("./UCIHARDataset/train/X_train.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 7352)
# X_test = read.table("./UCIHARDataset/test/X_test.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 2947)
# 
# subject_test = read.table("./UCIHARDataset/test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 2947)
# subject_train = read.table("./UCIHARDataset/train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 7352)
# 
# y_test = read.table("./UCIHARDataset/test/y_test.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 2947)
# y_train = read.table("./UCIHARDataset/train/y_train.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 7352)

mylist <- list(features, X_train, X_test, subject_test, subject_train, y_test, y_train)
print(lapply(mylist, dim))
features_trans = t(features)
##binding the first column 
rowbind <- rbind(X_train, X_test, row.names = NULL)
colnames(rowbind) <- features_trans[2,]
## dim(rowbinds) is  10299(7352+2947)   561
##binding the second column 
rowbind2 <- rbind(subject_train, subject_test, row.names = NULL)
colbind <- cbind(rowbind, rowbind2)
## rename the scond column to subject so it makes more sense
colnames(colbind)[562] <- "subject"

##binding the third column 
rowbind3 <- rbind(y_train, y_test, row.names = NULL)
colbind2 <- cbind(colbind, rowbind3)
## rename the third column to subject so it makes more sense
colnames(colbind2)[563] <- "activity"

## Merge the dataframe with activity_labels.txt
activity_labels = read.table("./UCIHARDataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE, nrows = 561)
merge = merge(colbind2, activity_labels, by.x="subject", by.y="V1", all=TRUE)
colnames(merge)[564] <- "activitytype"

## final_result <- colbind2