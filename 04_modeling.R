library(dplyr)
library(readr)
library(lubridate)
library(randomForest)
library(caret)

setwd("C:/Users/vishn/Videos/crime-hotspot-project")

crime_clean <- read_csv("data/chicago_crime_clean.csv")

hotspot_data <- crime_clean %>%
  group_by(district, hour) %>%
  summarise(crime_count = n(), .groups = "drop")

threshold <- quantile(hotspot_data$crime_count, 0.75)

hotspot_data <- hotspot_data %>%
  mutate(hotspot = ifelse(crime_count > threshold, "Yes", "No"))

hotspot_data$hotspot <- as.factor(hotspot_data$hotspot)
hotspot_data$district <- as.factor(hotspot_data$district)

set.seed(123)

train_index <- createDataPartition(hotspot_data$hotspot, p = 0.8, list = FALSE)
train_data <- hotspot_data[train_index, ]
test_data <- hotspot_data[-train_index, ]

log_model <- glm(hotspot ~ district + hour, data = train_data, family = binomial)

log_probs <- predict(log_model, test_data, type = "response")
log_pred <- ifelse(log_probs > 0.5, "Yes", "No")
log_pred <- as.factor(log_pred)

rf_model <- randomForest(hotspot ~ district + hour, data = train_data)

rf_pred <- predict(rf_model, test_data)

conf_matrix_log <- confusionMatrix(log_pred, test_data$hotspot, positive = "Yes")
conf_matrix_rf <- confusionMatrix(rf_pred, test_data$hotspot, positive = "Yes")

print(conf_matrix_log)
print(conf_matrix_rf)

capture.output(conf_matrix_log, file = "output/logistic_regression_results.txt")
capture.output(conf_matrix_rf, file = "output/random_forest_results.txt")   
