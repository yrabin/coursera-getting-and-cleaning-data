# Load data.table; if not available then install the package
if(require("data.table")) {
  print("Package data.table is successfully loaded.")
} else {
  print("installing package data.table package...")
  install.packages("data.table")

  # Load "data.table" for use
  if(require("data.table")) {
    print("Package data.table is successfully loaded .")
  } else {
    quit("Failed to load data.table package.")
  }
}


# Load reshape2; if not available then install the package
if(require("reshape2")) {
  print("reshape2 is successfully loaded.")
} else {
  print("installing package reshape2 package...")
  install.packages("reshape2")
    
  # Load "reshape2" for use
  if(require("reshape2")) {
    print("Package reshape2 is successfully loaded.")
  } else {
    quit("Failed to load reshape2 package.")
  }
}




print("Loading Activity Labels & Features/Variables")

# Load activities' labels
activity_labels <- read.table("./activity_labels.txt")[,2]

# Load features/variables
features <- read.table("./features.txt")[,2]


print("Subsetting Features/Variables for mean & std")

# Extract only the Mean and Standard Deviation for each feature
extracted_variables <- grepl("mean|std", features)


print("Processing X_test")
# Process X_test:
# --------------
# 1. Load and name X_test data containing values for each variable
X_test <- read.table("./test/X_test.txt")
names(X_test) <- features

# 2. Subset X_test for extracted variables (Mean and Standard Deviation)
X_test <- X_test[,extracted_variables]


print("Processing y_test")
# Process y_test:
# --------------
# 1. Load y_test data containing activity ID 
y_test <- read.table("./test/y_test.txt")

# 2. Label activity IDs from y_test
y_test[,2] <- activity_labels[y_test[,1]]

# 3. Name y_test data
names(y_test) <- c("Activity_ID", "Activity_Label")


print("Processing subject_test")
# Process subject_test:
# --------------------
# Load and name subject_test data
subject_test <- read.table("./test/subject_test.txt")
names(subject_test) <- "Subject_ID"


print("Binding test_dataset")
# Bind X_test, y_test and subject_test as test_dataset:
# ----------------------------------------------------
test_dataset <- cbind(as.data.table(subject_test), y_test, X_test)




print("Processing X_train")
# Process X_train:
# ---------------
# 1. Load and name X_train data containing values for each feature
X_train <- read.table("./train/X_train.txt")
names(X_train) <- features

# 2. Subset X_train for extracted variables (Mean and Standard Deviation)
X_train <- X_train[,extracted_variables]


print("Processing y_train")
# Process y_train:
# ---------------
# 1. Load y_train data containing activity ID 
y_train <- read.table("./train/y_train.txt")

# 2. Label activity IDs from y_train
y_train[,2] <- activity_labels[y_train[,1]]

# 3. Name y_train data
names(y_train) <- c("Activity_ID", "Activity_Label")


print("Processing subject_train")
# Process subject_train:
# --------------------_
# Load and name subject_train data
subject_train <- read.table("./train/subject_train.txt")
names(subject_train) <- "Subject_ID"


print("Binding train_dataset")
# Bind X_train, y_train and subject_train as train_dataset:
# --------------------------------------------------------
train_dataset <- cbind(as.data.table(subject_train), y_train, X_train)



print("Merging test_dataset and train_dataset")
# Merge test and train dataset:
# ----------------------------
merged_dataset <- rbind(test_dataset, train_dataset)


print("Transforming merged_dataset")
# Transform the merged dataset:
# ----------------------------
id_labels <- c("Subject_ID", "Activity_ID", "Activity_Label")
data_labels <- setdiff(colnames(merged_dataset), id_labels)
melt_data <- melt(merged_dataset, id = id_labels, measure.vars = data_labels)
tidy_dataset <- dcast(melt_data, Subject_ID + Activity_Label ~ variable, mean)


print("Saving into tidy_dataset.txt")
# Save the merged dataset:
# -----------------------
write.table(tidy_dataset, file = "tidy_dataset.txt", row.name=FALSE)
