
The following files are used in this repo:

1.  'CodeBook.md' - Describes variables in data set and how data was gathered and processed
2.  'run_analysis.R'- The R script used for the analysis
3.  'UCIDataset.zip' - The original data set.
4.  'tidydata.txt' The tidy dataset 
  
For processing data, please run the script run_analysis.R


Data was processed with below step in run_analysis.R
* Dowloading data from website and unzip
* Read data
* Merge data by rows
* Namming the coloumn
* Merge all data in to 1 dataset
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject
