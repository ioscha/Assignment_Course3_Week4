# Assignment_Course3_Week4

The run_assignment.R script transforms the Samsung data set from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
into a tidy data set.

## The steps are:
* Loading the individual parts of the training and test sets
* Loading the features.txt for labeling
* Naming the columns according to the features.txt
* Naming the columns of ".y" and ".subject" to "activity" and "subject"
* Adding the latter to "train/test.x" as new columns
* Merging the train and test set rowwise
* Select the columnnames with the Strings "mean()" or "std" and extract them into a new dataframe "subset"
* Create the vector of factors which describe the activities
* Substitute the coded activity numbers by the factors
* Group subset by activity and mean and take averages to create new data frame "tidyset"
* Write file
