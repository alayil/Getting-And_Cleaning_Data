
## Readme for run_analysis.R
By Praveen Syamakomalan; March 22, 2015

### Purpose
run_analysis.R script processes data from the Human Activity Recognition Using Smartphones Dataset to extract the 
average means and standard deviations of each variable for a given subject and activity, returning a tidy data frame 
containing these values.

run_analysis.R script was created as a part of the assignment for Getting and Cleaning Data Course offered on Coursera.

### Source:


Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws 

Data available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

With a full description here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Assumptions

* The data will be found in the directory "./UCIHARDataset/".
* The required packages "plyr" and "reshape2" are already installed.

### Use
To use the script at the prompt, call source("./run_analysis.R"), then run_analysis(). 
Output of the script is written to a data frame as the resulting table is too large.

### Functionality
* The script imports the test and training datasets (X_test.txt and X_train.txt) from the UCI HAR data 
and combines them into a single dataframe, with the columns named from the features.txt file provided in the archive.

* Partial string matching using grep is used to identify the columns that include mean() and std() in their name. These columns of interest are then assigned to a new data frame. 

* The activity labels for each observation (provided in Y_test.txt and Y_train.txt) are converted from numeric vectors to factors with the corresponding text activity label (found in activity_labels.txt) using the mapvalues function from plyr, and this factor is added to the data frame containing all the mean and standard deviation observations. An additional column containing the subject id for each observation (read in from subjects_test.txt and subjects_train.txt) is also included.

* The data frame is then averaged for each subject and activity for each variable, resulting in a data frame with 180 rows and 81 columns (subject, activity, then the 79 variables from the data set meeting the criteria). This is accomplished using the melt and dcast functions in the reshape2 library*.

* This data frame is returned from the function, meeting the requirements of the assignment.

> Credit for the idea to use these functions goes to Community TA David Hood on the Coursera course forum whose post reminded me of how easy it is to use these functions to achieve this goal.
