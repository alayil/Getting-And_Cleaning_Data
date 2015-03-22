## DATA DICTIONARY for tidy_movement_data.txt


# Feature Selection 
# =================

The features selected for this data frame came from the transformation of the data in the "Human Activity Recognition Using Smartphones Dataset Version 1.0", which in turn have been taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured, of accelerometer and gyroscope 3-axial raw signals tAcc-X/Y/Z and tGyro-X/Y/Z.

These signals were used to estimate variables of the feature vector for each pattern:  
-X/Y/Z is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-X/Y/Z
* tGravityAcc-X/Y/Z
* tBodyAccJerk-X/Y/Z
* tBodyGyro-X/Y/Z
* tBodyGyroJerk-X/Y/Z
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-X/Y/Z
* fBodyAccJerk-X/Y/Z
* fBodyGyro-X/Y/Z
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

angle(): Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean


Featured variables:
=========================

* mean() : 		Mean values of multiple measurements of the original variables.
				Type: Real number
		
* std(): 			Standard deviation of multiple measurements of the original variables.
				Type: Real number

* activity_id: 	Identifier, identifying the activity of each subject
				Type: 	Integer
				Values: 	1 : 6

* activity_name: 	Descriptive name of each subject's activity
				Type: 	Factor
				Values: 	WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* subject_id :	Identifier, identifying each subject
				Type: 	Integer
				Values: 	1 : 30
