
run_analysis <- 

# Check packages and load if not installed.
if("reshape2" %in% rownames(installed.packages()) == FALSE) {install.packages("reshape2")};library(reshape2);
if("stringr" %in% rownames(installed.packages()) == FALSE) {install.packages("stringr")};library(stringr);

## Step 1. Read activity labels and features files into R.
## Step 1 includes dropping unnecessary variables and re-naming.
act_labels <- read.fwf('activity_labels.txt', c(2,18),header=FALSE, col.names=c('Act_Label', 'Act_Desc'));
features <- read.csv("features.txt", header=FALSE, sep=" ", col.names=c('Var', 'Measure'));
features_label <- features[,2];

## READ IN AND PREP TEST FILES.
## Step 2. Read in all test files, including the measures, activities,
## and subject IDs. This is in preparation for the data merge.
test_activities <- read.csv("./test/y_test.txt", header=FALSE, col.names=c('Act_Label'));
test_subject <- read.csv("./test/subject_test.txt", header=FALSE, col.names=c('Subject_ID'));
test_measures <- read.table("./test/X_test.txt", header=FALSE, col.names=features_label);

## Step 3. Bind the subject ID and activities to the measures dataset.
test_raw <- cbind(test_activities, test_subject, test_measures);

## Step 4. Establish data source variable.
test_raw$data_src = "test";

## Step 5. Only keep necessary variables (IDs, mean, std dev.)
test_raw2 <- test_raw[,grep(("data_src|Label|Subject|Mean|mean|std|Std"), colnames(test_raw))];

## READ IN AND PREP TRAIN FILES.
## Step 6. Read in all training files, including the measures, activities,
## and subject IDs. This is in preparation for the data merge.
train_activities <- read.csv("./train/y_train.txt", header=FALSE, col.names=c('Act_Label'));
train_subject <- read.csv("./train/subject_train.txt", header=FALSE, col.names=c('Subject_ID'));
train_measures <- read.table("./train/X_train.txt", header=FALSE, col.names=features_label);

## Step 7. Bind the subject ID and activities to the measures dataset.
train_raw <- cbind(train_activities, train_subject, train_measures);

## Step 8. Establish data source variable.
train_raw$data_src = "train";

## Step 9. Only keep necessary variables (IDs, mean, std dev.)
train_raw2 <- train_raw[,grep(("data_src|Label|Subject|Mean|mean|std|Std"), colnames(train_raw))];

## Step 10. Combine test and train data.
combined_data <- rbind(train_raw2, test_raw2);

## Step 11. Merge combined data set with activity descriptions.
## This data frame created in step 11 is the data table represented
## described in step 4 of the class project description.
combined_data_final <- merge(combined_data, act_labels, by="Act_Label");

## Step 12. Transform the data using melt to obtain a row for every measurement
data_melt <- melt(combined_data_final, id=c("Subject_ID", "Act_Desc"), measure.vars=c(colnames(combined_data_final[,3:88])));
data_melt$combined <- paste(data_melt$Subject_ID, data_melt$Act_Desc, sep="-");

## Step 13. Calculate mean for each variable, subject, and activity using reshape package.
data_recast <- dcast(data_melt, combined ~ variable, mean);

## Step 14. Create final tidy data set as described in step 5 of the project assignment.
data_recast$Activity <- word(data_recast$combined,start=-1,sep="-");
data_recast$Subject_ID <- word(data_recast$combined,sep="-");
final_data <- data_recast[,-grep("combined",colnames(data_recast))];
final_data <- final_data[c(88,87,2:86)];


## Step 15. Write final table to output.
write.table(final_data, file="final_inertia_data.txt", row.name=FALSE)



