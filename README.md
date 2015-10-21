#Project 1: Getting and Cleaning Data (readme)

##Processing Steps

1. Download the data from
2. Unzip the file in the appropriate directory
3. If not already installed, install.packages("reshape2") and load library
4. Calling run_analysis.R does the following:
- Uses read.csv, to read each of the files contained in both the test and train folders (6 files total). 
- Uses rbind to combine the complementary files (test/subject_test with train/subject_train, and so forth).
- Uses colnames to apply column headers to the subjects and labels files
- Uses read.csv and the features.txt file with colnames to apply column labels to the sets file
- Column labels in sets are transformed into lowercase
- Creates more descriptive labels for the sets file with gsub
- Uses cbind to bring together the three files (subjects, labels, and sets)
- Uses grepl and subsetting to identify and select columns including the mean or standard deviation
- Applies descriptive language to the labels using subsetting and information from the original dataset
- Using melt and dcast, creates a tidy dataset that includes the average of each variable for each activity and each subject.
- The tidy dataset is written to disk using write.table
 
