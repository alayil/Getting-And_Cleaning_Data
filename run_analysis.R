## Coursera- Getting and Cleaning Data Assignment.
## File Name run_analysis.R
## By Praveen Syamakomalan; March 22, 2015
## This project is based on the Davide Anguita, Alessandro Ghio, Luca Oneto,
## Xavier Parra and Jorge L. Reyes-Ortiz publication
## "Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine".
## International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
## This script creates a tidy dataset for further analysis by merging a number of .txt files and produces



## Confirm whether required package is installed 

if (!("reshape2" %in% rownames(installed.packages())) ) {
  print("Please install required package \"reshape2\" before proceeding")
} else {
  
  ## Open reshape2 libraries
  library(reshape2)
  
  ## Read required .txt source files and label the datasets
  ## Read all activities and their names and label the aproppriate columns
  activity_labels <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))
  
  ## Read the column names
  features <- read.table("features.txt")
  feature_names <- features[,2]
  
  ## Read test data and label the dataframe's columns
  testdata <- read.table("./test/X_test.txt")
  colnames(testdata) <- feature_names
  
  ## Read training data and label the columns
  traindata <- read.table("./train/X_train.txt")
  colnames(traindata) <- feature_names
  
  ## Read the ids of the test subjects and label the columns
  test_subject_id <- read.table("./test/subject_test.txt")
  colnames(test_subject_id) <- "subject_id"
  
  ## Read the activity id's of test data and label the columns
  test_activity_id <- read.table("./test/y_test.txt")
  colnames(test_activity_id) <- "activity_id"
  
  ## Read the ids of test subjects and label the columns
  train_subject_id <- read.table("./train/subject_train.txt")
  colnames(train_subject_id) <- "subject_id"
  
  ## Read the activity id's of the training data then label the columns
  train_activity_id <- read.table("./train/y_train.txt")
  colnames(train_activity_id) <- "activity_id"
  
  ##Combine test subject, activity id's and test data into single dataframe
  test_data <- cbind(test_subject_id , test_activity_id , testdata)
  
  ##Combine train subject, activity id's and train data into single dataframe
  train_data <- cbind(train_subject_id , train_activity_id , traindata)
  
  ##Combine test data and train data into single dataframe
  all_data <- rbind(train_data,test_data)
  
  ##Preserve only columns refering to mean() or std() values
  mean_col_idx <- grep("mean",names(all_data),ignore.case=TRUE)
  mean_col_names <- names(all_data)[mean_col_idx]
  std_col_idx <- grep("std",names(all_data),ignore.case=TRUE)
  std_col_names <- names(all_data)[std_col_idx]
  meanstddata <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]
  
  ##Merge the activities with mean/std values dataset to get single dataset 
  ##with descriptive activity names
  descrnames <- merge(activity_labels,meanstddata,by.x="activity_id",by.y="activity_id",all=TRUE)
  
  ##Melt the dataset with the descriptive activity names
  data_melt <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))
  
  ##Cast melted dataset according to the average of each variable, activity and subject
  mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)
  
  ## Write the tidy dataset to new file
  write.table(mean_data,"tidy_movement_data.txt")
}
