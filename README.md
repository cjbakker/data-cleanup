#Project 1: Getting and Cleaning Data (readme)

##Processing Steps

1. Download the data from
2. Unzip the file in the appropriate directory
3. If not already installed, install.packages("reshape2") and load library
4. Calling run_analysis.R does the following:
 1. Uses 'read.csv', to read each of the files contained in both the test and train folders (6 files total). 
 2. Uses 'rbind()' to combine the complementary files (test/subject_test with train/subject_train, and so forth). This produces three files. 
 3. Uses colnames to apply column headers to the subjects and labels files
 4. Uses 'read.csv' and the 'features.txt' file with 'colnames()' to apply column labels to the sets file
 5. Column labels in sets are transformed into lowercase
 6. Creates more descriptive labels for the sets file with 'gsub'
 7. Uses 'cbind()' to bring together the three files (subjects, labels, and sets)
 8. Uses 'grepl()' and subsetting to identify and select columns including the mean or standard deviation
 9. Applies descriptive language to the labels using subsetting and information found in 'activity_labels.txt' in the original dataset
 10. Using 'melt()' and 'dcast()', creates a tidy dataset that includes the average of each variable for each activity and each subject.
 11. The tidy dataset is written to disk using 'write.table()'
 
