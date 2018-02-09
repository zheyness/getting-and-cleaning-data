### Project Requirements

A script that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Variables
* *subject_train, x_train, y_train, subject_text, x_test, y_test*

tables containing data from the downloaded files

* *subject_data, x_data, y_data, all_data*

tables containing merged training and testing datasets

* *features, activities*

lists provided as labels from the downloaded files

* *mean_and_sd*

selected data which only contains means and standard deviations for each measurements

* *tidy_data*

independent tidy dataset with the average of each variable for each activity and each subject

### Code Flow
The script is divided into 5 sections. 

1. Read all the neccessary tables and assign it to a variable. Merge training and testing datasets.
2. Read the features table provided and assign it to a variable. Choose features which contains "mean"and "std" using grep. 
Extract from the x_data those corresponds to the selected features. 
3. Read the activities table provided and assign it to y_data. 
4. Assign labesl to x_data using the feature extracted from Section 2. Merge all data into one dataset using the cbind function. 
5. Create another dataset from all_data using the chain technique. Use group_by function to  be able to operate by group. In this funtion, 
the existing data set is group by subject and activity. The summarise_all function was used to be able to compute for the mean in each catogory. 
