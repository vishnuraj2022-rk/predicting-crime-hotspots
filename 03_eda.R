library(dplyr)
library(readr)
library(ggplot2)

setwd("C:/Users/vishn/Videos/crime-hotspot-project")

crime_clean <- read_csv("data/chicago_crime_clean.csv")

crime_type_summary <- crime_clean %>%
  count(primary_type, sort = TRUE)

district_summary <- crime_clean %>%
  count(district, sort = TRUE)

hour_summary <- crime_clean %>%
  count(hour)

month_summary <- crime_clean %>%
  count(month)

arrest_summary <- crime_clean %>%
  count(arrest)

p1 <- ggplot(crime_type_summary[1:10, ], aes(x = reorder(primary_type, n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(title = "Top 10 Crime Types", x = "Crime Type", y = "Count")

p2 <- ggplot(hour_summary, aes(x = hour, y = n)) +
  geom_line() +
  geom_point() +
  labs(title = "Crimes by Hour", x = "Hour", y = "Count")

p3 <- ggplot(month_summary, aes(x = month, y = n)) +
  geom_line() +
  geom_point() +
  labs(title = "Crimes by Month", x = "Month", y = "Count")

p4 <- ggplot(arrest_summary, aes(x = as.factor(arrest), y = n)) +
  geom_col() +
  labs(title = "Arrest vs Non-Arrest", x = "Arrest", y = "Count")

p5 <- ggplot(district_summary[1:10, ], aes(x = reorder(as.factor(district), n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(title = "Top 10 Districts by Crime Count", x = "District", y = "Count")

ggsave("output/top_10_crime_types.png", plot = p1, width = 8, height = 5)
ggsave("output/crimes_by_hour.png", plot = p2, width = 8, height = 5)
ggsave("output/crimes_by_month.png", plot = p3, width = 8, height = 5)
ggsave("output/arrest_vs_nonarrest.png", plot = p4, width = 8, height = 5)
ggsave("output/top_10_districts.png", plot = p5, width = 8, height = 5)

summary(crime_clean)  
