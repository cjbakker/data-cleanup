if(require("reshape2")){
    print("reshape2 is installed")
} else {
    print("trying to install reshape2")
    install.packages("reshape2")
    if(require(reshape2)){
        print("reshape2 installed and loaded")
    } else {
        stop("could not install required packages (reshape2)")
    }
}
test_subject <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE) 
test_labels <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
test_set <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
train_subject <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
train_labels <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
train_set <- read.csv("UCI HAR Dataset/train/x_train.txt", sep="", header=FALSE)
subjects <- rbind(test_subject, train_subject) 
colnames(subjects) <- "subjects"
labels <- rbind(test_labels, train_labels)
colnames(labels) <- "labels"
sets <- rbind(test_set, train_set)
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features$V2 <- as.character(features$V2)
colnames(sets) <- tolower(features$V2)
colnames(sets) <- gsub("()-", "", colnames(sets))
colnames(sets) <- gsub("acc", "acceleration", colnames(sets))
colnames(sets) <- gsub("gyro", "gyroscope", colnames(sets))
colnames(sets) <- gsub("tbody", "body", colnames(sets))
colnames(sets) <- gsub("fbody", "body", colnames(sets))
colnames(sets) <- gsub("bodybody", "body", colnames(sets))
colnames(sets) <- gsub("tgravity", "gravity", colnames(sets))
complete <- cbind(subjects,labels,sets) # now cbind it all together
selected <- grepl("(mean|std)\\(\\)", features$V2)
complete <- complete[selected==TRUE] 
complete$labels[complete$labels==1] <- "walking"
complete$labels[complete$labels==2] <- "walkingupstairs"
complete$labels[complete$labels==3] <- "walkingdownstairs"
complete$labels[complete$labels==4] <- "sitting"
complete$labels[complete$labels==5] <- "standing"
complete$labels[complete$labels==6] <- "laying"
tidy <- melt(complete, id=c("subjects", "labels"))
tidy <- dcast(tidy, subjects+labels ~ variable, mean)
write.table(tidy, file="tidy.txt", row.name=FALSE) 
print("tidy data set has been created")
