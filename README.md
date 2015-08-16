# Getting-and-Cleaning-Data-Course-Project

Getting and Cleaning Data is the third course in the John Hopkins University Data Science Specialization given through Coursera. This repository contains the necessary information and files to receive 100% credit :) It explains how the script works.

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. I will be graded by my peers on a series of yes/no questions related to the project. I will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with my script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data called CodeBook.md.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article --> http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Please download the data files for the project into the home directory. This will create the folder "~/UCI HAR Dataset". Please extract the files into this directory by right-clicking on the .zip file and choosing "extract all" and browsing to the home directory. This is the correct folder structure to run the script. The output file will be located in the home directory. Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This repo contains one R script that I created called run_analysis.R that does the following. 
(1) Merges the training and the test sets to create one data set.
(2) Extracts only the measurements on the mean and standard deviation for each measurement. 
(3) Uses descriptive activity names to name the activities in the data set
(4) Appropriately labels the data set with descriptive variable names. 
(5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The data set created from running run_analysis.R can be viewed by placing the following code into R or RStudio.

filepath <- "~/tidydata.txt"
data <- read.table(filepath, header = TRUE)
View(data)

