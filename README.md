#Course Project: Getting and Cleaning Data
Repository for "Getting and Cleaning data" project on Coursera (JHU Data Science Specialization).



## Project Description

**The purpose** of this project is to demonstrate ability to collect, work with, and clean a data set.


**The goal** is to prepare tidy data that can be used for later analysis. 



## Original Data Source

* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



## Transformation implemented in ```run_analysis.R```

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



## Repository File list

* **README.md**       : This file
* **codeBook.md**     : Information about raw and tidy data set and elaboration made to transform them
* **run_analysis.R**  : R script to transform raw data set in a tidy one
* **tidy_data.txt**   : The tidy data set



## Generation of ```tidy_dataset.txt```

1. Clone this repository: "git clone https://github.com/yrabin/coursera-getting-and-cleaning-data.git".
2. Download zipped raw data from original source [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
3. Extract the zipped raw data into a local folder; sub-folder "UCI HAR Dataset" is created.
4. Copy "run_analysis.R" script from the git directory to the "UCI HAR Dataset".
5. Open a R console with working directory set to "UCI HAR Dataset".
6. Source run_analysis.R script: ```source('run_analysis.R')```
7. After execution, "tidy_dataset.txt" will be generated.



## References:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


