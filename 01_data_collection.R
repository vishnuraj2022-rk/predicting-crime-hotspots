install.packages(c("httr", "jsonlite", "dplyr", "readr"))

library(httr)
library(jsonlite)
library(dplyr)
library(readr)

setwd("C:/Users/vishn/Videos/crime-hotspot-project")

base_url <- "https://data.cityofchicago.org/resource/ijzp-q8t2.json"

fetch_chunk <- function(limit = 5000, offset = 0) {
  res <- GET(
    base_url,
    query = list(
      `$limit` = limit,
      `$offset` = offset,
      `$select` = "id,date,primary_type,description,arrest,domestic,district,beat,community_area,latitude,longitude"
    )
  )
  
  stop_for_status(res)
  txt <- content(res, as = "text", encoding = "UTF-8")
  fromJSON(txt, flatten = TRUE)
}

chunk1  <- fetch_chunk(5000, 0)
chunk2  <- fetch_chunk(5000, 5000)
chunk3  <- fetch_chunk(5000, 10000)
chunk4  <- fetch_chunk(5000, 15000)
chunk5  <- fetch_chunk(5000, 20000)
chunk6  <- fetch_chunk(5000, 25000)
chunk7  <- fetch_chunk(5000, 30000)
chunk8  <- fetch_chunk(5000, 35000)
chunk9  <- fetch_chunk(5000, 40000)
chunk10 <- fetch_chunk(5000, 45000)

crime_data <- bind_rows(
  chunk1, chunk2, chunk3, chunk4, chunk5,
  chunk6, chunk7, chunk8, chunk9, chunk10
)

write_csv(crime_data, "data/chicago_crime_raw.csv")

crime_check <- read.csv("data/chicago_crime_raw.csv")

dim(crime_data)
dim(crime_check)
str(crime_check)