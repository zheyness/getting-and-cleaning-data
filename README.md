### getting-and-cleaning-data
A project under Getting and Cleaning Data module.

Jo Hanna Lindsey Serato

### Assignment Submission Files
1. run_analysis.R
2. README.md
3. CodeBook.md
4. tidydata.txt

### Instructions
1. Checkout code using the link: 
https://github.com/zheyness/getting-and-cleaning-data/blob/master/run_analysis.R
2. Download the data set from, 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. Unzip the data set in your working directory.
4. Open RStudio and open the R script using the source code- "run_analysis.R"
5. Edit and set your working directory using setwd() from the code. Note that include the address of the unzipped file: 
UCI HAR Dataset 
6. Run Rscript. It will generate a new dataset called, "tidydata.txt"

### Code Flow
The script is divided into 5 sections. 

1. Read all the neccessary tables and assign it to a variable. Merge training and testing datasets.
2. Read the features table provided and assign it to a variable. Choose features which contains "mean"and "std" using grep. 
Extract from the x_data those corresponds to the selected features. 
3. Read the activities table provided and assign it to y_data. 
4. Assign labesl to x_data using the feature extracted from Section 2. Merge all data into one dataset using the cbind function. 
5. Create another dataset from all_data using the chain technique. Use group_by function to  be able to operate by group. In this funtion, 
the existing data set is group by subject and activity. The summarise_all function was used to be able to compute for the mean in each catogory. 
