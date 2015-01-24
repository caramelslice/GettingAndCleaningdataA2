## This is the course project for Getting and Cleaning Data

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Note that I've removed the space in the folder name --> UCIHARDataset
UCIHARDataset is the data that contains the raw datasets. Only these following files were used:
features.txt
X_train.txt
X_test.txt
subject_test.txt
subject_train.txt
y_test.txt
y_train.txt

The raw data files were merged based on the following picture found on our discussion form
https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png
There is also a copy of the image called "DF_GUIDELINE.png" in the same directory. The finaltidy.txt is merged and shaped into one dataset base on the depicated guideline. 


The merged dataset does not include the inertial folder. Because a subsequent steps calls on us to get rid of all the variables that are not to do with mean or standard deviation (worked out from the column names- the features).

The step-by-step instructions on the data merging process are included in the run_analysis.R file. 