# Getting-and-Cleaning-Data-Course-Project
This is the code for the final project for getting and cleaning data from Coursera

This code creates the independent tidy data set with the average of each variable for each activity and each subject for the course project.

There are 7 key steps in the process.

1. Read and prepare header files. 
  - features is read directly in as-is
  - colnames are added to the activity.labels data, both for clarity and to enable joining in dplyr later
2. Read and prepare training data
  - read in subject column and rename it to Subject
  - read in data and add coumn names using the features data frame
  - read in activity data and rename the column to activity_code to enable joining in dplyr later
  - join the activity column with the data
3. Read and prepare test data (Repeat steps from Step 2 but for the TEST data
4. Append test data to training data
5. Add descriptive activity label names, using inner_join in dplyr 
6. Restrict data columns to mean and std columns using a regular expression to search column names for mean() and std().  NOTE: meanFreq is intentionally dropped
7. Create and export the tidy summarized data set 

