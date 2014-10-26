# Code Book

This code book that describes the variables, the data, and any transformations or work that were performed to clean up the data.



## The Data


### Original Data Source
* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Dataset Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


The original dataset includes the following files:
- 'README.txt'
- 'features_info.txt'  : Shows information about the variables used on the feature vector.
- 'features.txt'       : List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt'  : Training set.
- 'train/y_train.txt'  : Training labels.
- 'test/X_test.txt'    : Test set.
- 'test/y_test.txt'    : Test labels.


The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt':
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt':
The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt':
The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt':
The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws


### Transformation Details

Transformation is applied to extract only Mean and Standard Deviation from train and test data. Combined with Subject ID and Activity Label, the transformation creates `tidy_dataset.csv`.


Transformation is implemented through ```run_analysis.R```; the implementation steps are as follow:

1. Require both ```data.table``` and ```reshape2```
2. Load complete variables from all features
3. Create boolean vector to select only ```mean``` and ```std``` variables
4. Load and name X_test/train data containing values for each variables
5. Subset X_test/train using the boolean vector above
6. Load y_test/train data containing activity ID
7. Label activity IDs from y_test/train (create new coloumn)
8. Name y_test/train data
9. Load and name subject_test/train data
10. Bind X_test/train, y_test/train and subject_test/train as test/train_dataset
11. Merge test_dataset and train_dataset
12. Transform the merged dataset to flatten it
13. Save the merged dataset as ```tidy_dataset.csv```


Step **4** to **10** are repeated for each ```test``` and ```train``` dataset:


## Variables


### ID Fields

* `Subject_ID`     - The participant ("subject") ID
* `Activity_Label` - The activity performed for the measurement


### Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 
- **mean()**       : Mean value
- **std()**        : Standard deviation
- mad()        : Median absolute deviation 
- max()        : Largest value in array
- min()        : Smallest value in array
- sma()        : Signal magnitude area
- energy()     : Energy measure. Sum of the squares divided by the number of values. 
- iqr()        : Interquartile range 
- entropy()    : Signal entropy
- arCoeff()    : Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds()    : index of the frequency component with largest magnitude
- meanFreq()   : Weighted average of the frequency components to obtain a mean frequency
- skewness()   : skewness of the frequency domain signal 
- kurtosis()   : kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle()      : Angle between to vectors.


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean


### Extracted Variables

Of the set of variables from features described above, only `mean` and `std` are extracted for `tidy_dataset.csv`. The complete list of variables:

* `tBodyAcc-mean()-X` (column `1`)
* `tBodyAcc-mean()-Y` (column `2`)
* `tBodyAcc-mean()-Z` (column `3`)
* `tBodyAcc-std()-X` (column `4`)
* `tBodyAcc-std()-Y` (column `5`)
* `tBodyAcc-std()-Z` (column `6`)
* `tGravityAcc-mean()-X` (column `41`)
* `tGravityAcc-mean()-Y` (column `42`)
* `tGravityAcc-mean()-Z` (column `43`)
* `tGravityAcc-std()-X` (column `44`)
* `tGravityAcc-std()-Y` (column `45`)
* `tGravityAcc-std()-Z` (column `46`)
* `tBodyAccJerk-mean()-X` (column `81`)
* `tBodyAccJerk-mean()-Y` (column `82`)
* `tBodyAccJerk-mean()-Z` (column `83`)
* `tBodyAccJerk-std()-X` (column `84`)
* `tBodyAccJerk-std()-Y` (column `85`)
* `tBodyAccJerk-std()-Z` (column `86`)
* `tBodyGyro-mean()-X` (column `121`)
* `tBodyGyro-mean()-Y` (column `122`)
* `tBodyGyro-mean()-Z` (column `123`)
* `tBodyGyro-std()-X` (column `124`)
* `tBodyGyro-std()-Y` (column `125`)
* `tBodyGyro-std()-Z` (column `126`)
* `tBodyGyroJerk-mean()-X` (column `161`)
* `tBodyGyroJerk-mean()-Y` (column `162`)
* `tBodyGyroJerk-mean()-Z` (column `163`)
* `tBodyGyroJerk-std()-X` (column `164`)
* `tBodyGyroJerk-std()-Y` (column `165`)
* `tBodyGyroJerk-std()-Z` (column `166`)
* `tBodyAccMag-mean()` (column `201`)
* `tBodyAccMag-std()` (column `202`)
* `tGravityAccMag-mean()` (column `214`)
* `tGravityAccMag-std()` (column `215`)
* `tBodyAccJerkMag-mean()` (column `227`)
* `tBodyAccJerkMag-std()` (column `228`)
* `tBodyGyroMag-mean()` (column `240`)
* `tBodyGyroMag-std()` (column `241`)
* `tBodyGyroJerkMag-mean()` (column `253`)
* `tBodyGyroJerkMag-std()` (column `254`)
* `fBodyAcc-mean()-X` (column `266`)
* `fBodyAcc-mean()-Y` (column `267`)
* `fBodyAcc-mean()-Z` (column `268`)
* `fBodyAcc-std()-X` (column `269`)
* `fBodyAcc-std()-Y` (column `270`)
* `fBodyAcc-std()-Z` (column `271`)
* `fBodyAccJerk-mean()-X` (column `345`)
* `fBodyAccJerk-mean()-Y` (column `346`)
* `fBodyAccJerk-mean()-Z` (column `347`)
* `fBodyAccJerk-std()-X` (column `348`)
* `fBodyAccJerk-std()-Y` (column `349`)
* `fBodyAccJerk-std()-Z` (column `350`)
* `fBodyGyro-mean()-X` (column `424`)
* `fBodyGyro-mean()-Y` (column `425`)
* `fBodyGyro-mean()-Z` (column `426`)
* `fBodyGyro-std()-X` (column `427`)
* `fBodyGyro-std()-Y` (column `428`)
* `fBodyGyro-std()-Z` (column `429`)
* `fBodyAccMag-mean()` (column `503`)
* `fBodyAccMag-std()` (column `504`)
* `fBodyBodyAccJerkMag-mean()` (column `516`)
* `fBodyBodyAccJerkMag-std()` (column `517`)
* `fBodyBodyGyroMag-mean()` (column `529`)
* `fBodyBodyGyroMag-std()` (column `530`)
* `fBodyBodyGyroJerkMag-mean()` (column `542`)
* `fBodyBodyGyroJerkMag-std()` (column `543`)


### Extracted Features Names Vector

```R
c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z", "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()")
```


### Activity Labels Vector

```R
c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
```



## References

[1] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

