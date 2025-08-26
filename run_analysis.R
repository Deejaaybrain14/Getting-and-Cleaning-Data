# run_analysis.R
# Autor: [Bea Herrera]
# Objetivo: Limpiar y preparar los datos del proyecto UCI HAR Dataset

library(dplyr)

# 1. Descargar y descomprimir los datos si no existen
filename <- "dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists(filename)){
  download.file(fileURL, filename, method="curl")
}
if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

# 2. Cargar datos de entrenamiento y prueba
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index","feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# 3. Unir datos de entrenamiento y prueba
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
merged <- cbind(Subject, Y, X)

# 4. Extraer solo medidas de media y desviación estándar
tidy <- merged %>% select(subject, code, contains("mean"), contains("std"))

# 5. Usar nombres de actividades descriptivos
tidy$code <- activities[tidy$code, 2]

# 6. Etiquetar con nombres descriptivos
names(tidy)[2] <- "activity"
names(tidy) <- gsub("^t", "Time", names(tidy))
names(tidy) <- gsub("^f", "Frequency", names(tidy))
names(tidy) <- gsub("Acc", "Accelerometer", names(tidy))
names(tidy) <- gsub("Gyro", "Gyroscope", names(tidy))
names(tidy) <- gsub("Mag", "Magnitude", names(tidy))
names(tidy) <- gsub("BodyBody", "Body", names(tidy))
names(tidy) <- gsub("-mean\\(\\)", "Mean", names(tidy), ignore.case = TRUE)
names(tidy) <- gsub("-std\\(\\)", "STD", names(tidy), ignore.case = TRUE)
names(tidy) <- gsub("-freq\\(\\)", "Frequency", names(tidy), ignore.case = TRUE)

# 7. Crear dataset final con la media de cada variable por sujeto y actividad
finalData <- tidy %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# 8. Guardar en archivo
write.table(finalData, "tidy_dataset.txt", row.name=FALSE)
