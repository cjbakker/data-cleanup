#Project 1: Getting and Cleaning Data (readme)

First, download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, unzip the file, and set the working directory. 

##Processing Steps

Calling run_analysis.R does the following:

1. Uses `install.packages("reshape2")` to install necessary packages if not already present
2. Uses `read.csv`, to read each of the files contained in both the test and train folders (6 files total). 
3. Uses `rbind()` to combine the complementary files (test/subject_test with train/subject_train, and so forth). This produces three files. 
4. Uses colnames to apply column headers to the subjects and labels files
5. Uses `read.csv` and the 'features.txt' file with `colnames()` to apply column labels to the sets file
6. Column labels in sets are transformed into lowercase
7. Creates more descriptive labels for the sets file with `gsub`
8. Uses `cbind()` to bring together the three files (subjects, labels, and sets)
9. Uses `grepl()` and subsetting to identify and select columns including the mean or standard deviation
10. Applies descriptive language to the labels using subsetting and information found in 'activity_labels.txt' in the original dataset
11. Using `melt()` and `dcast()`, creates a tidy dataset that includes the average of each variable for each activity and each subject.
12. The tidy dataset is written to disk using `write.table`

If the process is successful, user will see two printed messages: 'reshape2 is installed' and 'tidy data set has been created.'
 
