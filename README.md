GettingCleaningData
===================

Introduction.
This is the README file for the assignment for Coursera's Getting and Cleaning Data course. This file explains where to get the data for the assignment and how to execute the script 'run_analysis.R'.

Obtaining the Data.
The data for this assignment can be obtained from the link http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. After navigating to this website, click the link at the top of the page labeled 'Data Folder'. The zip file from this link should be downloaded to your working directory and extracted to the same working directory.

Executing the Script.
The script to execute the analysis for this assignment is posted in this GitHub repo as 'run_anaysis.R'. Simply copy this script file into your working directory after downloading the data. After the script and data have been loaded into your working directory, all you have to do to execute the analysis is type source("get_analysis.R") into your R console. In addition to the code, the script includes detailed comments describing the transformations occuring to the data during the analysis. The final result of the analysis, 'final_inertia_data.txt', will be exported to your working directory at the end of the script.
