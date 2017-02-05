#Part 1 

features <- read.table("features.txt")
features <- features[ , 2]

people_test <- read.table("subject_test.txt", col.names= "subjects")
label_test <- read.table("y_test.txt", col.names="Activity")
x_test <- read.table("x_test.txt", col.names = features)
x_test_fin <- x_test[ , grepl( "[Mm]ean|*[Ss]td" , names( x_test ) ) ]
data1 <- cbind(people_test, label_test, test, x_test_fin)

#Part 2

people_train <- read.table("subject_train.txt", col.names= "subjects")
label_train <- read.table("y_train.txt", col.names="Activity")
x_train <- read.table("x_train.txt", col.names = features)
x_train_fin <- x_train[ , grepl( "[Mm]ean|*[Ss]td" , names( x_train ) ) ]
data2 <- cbind(people_train, label_train, train, x_train_fin)

#Part 3
data_fin <- rbind(data1, data2)

#Part4
list_act <- list("walking","walking_upstairs","walking_downstairs","sitting", "standing","laying")
for (i in 1:nrow(data_fin)){
if (data_fin[ i , 2] == 1) {
  data_fin[i , 2] <- list_act[1]
} else if (data_fin[ i , 2] == 2) {
  data_fin[i , 2] <- list_act[2]
}else if (data_fin[ i , 2] == 3) {
  data_fin[i , 2] <- list_act[3]
}else if (data_fin[ i , 2] == 4) {
  data_fin[i , 2] <- list_act[4]
}else if (data_fin[ i , 2] == 5) {
  data_fin[i , 2] <- list_act[5]
} else if (data_fin[ i , 2] == 6) {
  data_fin[i , 2] <- list_act[6]
}
}
  
#Part5
agg_data <- aggregate(data_fin, by = list(data_fin$subjects, data_fin$Activity), FUN = mean, na.rm = TRUE)
agg_data <- agg_data[ , -(3:4:5)]
fin <- write.table(agg_data, file = "Final data.csv", row.names = FALSE)

