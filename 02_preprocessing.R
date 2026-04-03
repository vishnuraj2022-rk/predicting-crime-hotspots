library(dplyr)
library(readr)
library(lubridate)

setwd("C:/Users/vishn/Videos/crime-hotspot-project")

crime_data <- read_csv("data/chicago_crime_raw.csv")

colSums(is.na(crime_data))

crime_clean <- crime_data %>%
  filter(!is.na(date),
         !is.na(primary_type),
         !is.na(district),
         !is.na(community_area),
         !is.na(latitude),
         !is.na(longitude))

crime_clean <- crime_clean %>%
  mutate(
    date = ymd_hms(date, quiet = TRUE),
    hour = hour(date),
    day = day(date),
    month = month(date),
    year = year(date),
    weekday = wday(date, label = TRUE),
    weekend = ifelse(weekday %in% c("Sat", "Sun"), "Weekend", "Weekday")
  )

crime_clean <- crime_clean %>%
  filter(!is.na(date),
         !is.na(hour),
         !is.na(month),
         !is.na(year))

write_csv(crime_clean, "data/chicago_crime_clean.csv")

dim(crime_clean)
str(crime_clean)
summary(crime_clean)