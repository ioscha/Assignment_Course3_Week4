library(dplyr)

# Load Datasets
test.x <- read.table("./test/X_test.txt")
test.y <- read.table("./test/y_test.txt")
test.subject <- read.table("./test/subject_test.txt")
train.x <- read.table("./train/X_train.txt")
train.y <- read.table("./train/y_train.txt")
train.subject <- read.table("./train/subject_train.txt")
features <- read.table("./features.txt")
feat <- features$V2

#Rename Columns
colnames(test.x) <- paste(feat)
colnames(train.x) <- paste(feat)
colnames(test.subject) <- "subject"
colnames(train.subject) <- "subject"
colnames(test.y) <- "activity"
colnames(train.y)<- "activity"

#Merge Datasets
test <-cbind(test.x,test.y,test.subject)
train <- cbind(train.x,train.y,train.subject)
data <- rbind(test,train)

#Extract means, stds, activity and subject
meanstdfeat <- feat[grep("mean()|std()",feat)]
subset <- data[,c(meanstdfeat,"activity","subject")]

#Descriptive activities
activities <- factor(c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
subset$activity <- sapply(subset$activity,function(x) activities[x])

#Step 5 data set
tidyset <- subset %>% group_by(activity,subject) %>% summarise_all(funs(mean))
write.table(tidyset,"./my_very_tidy_dataset.txt", row.name=FALSE)
