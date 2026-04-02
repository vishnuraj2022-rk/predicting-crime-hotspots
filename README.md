# Predicting Crime Hotspots for Patrol Planning Using Chicago Crime Data

## Project Overview
This project focuses on predicting crime hotspot-prone area and time combinations using historical Chicago crime data. The objective is to support patrol planning by identifying locations and hours with a higher likelihood of crime occurrence. The project follows an end-to-end data science workflow using R for data collection, preprocessing, analysis, and modeling, and Power BI Desktop for dashboard creation.

## Problem Statement
Police patrol resources are limited, while crime patterns vary across districts, time periods, and offense categories. This project analyzes open Chicago crime records to identify hotspot patterns and classify district-hour combinations as hotspot or non-hotspot. The results can help improve patrol allocation and urban safety planning.

## Objectives
- Collect crime records from a public open-data API
- Preprocess and clean the crime dataset in R
- Perform exploratory data analysis with multiple visualizations
- Engineer time-based and location-based features
- Build hotspot classification models
- Compare Logistic Regression and Random Forest performance
- Create an interactive Power BI dashboard with R visuals
- Maintain a version-controlled project workflow using GitHub

## Domain
Smart Cities / Public Safety / Urban Safety

## Dataset Information
- **Dataset Source:** City of Chicago Data Portal – Crimes: 2001 to Present
- **Dataset Type:** Public open government dataset
- **Original Access Mode:** JSON via Socrata API
- **Project Dataset Size (raw):** 50,000 rows
- **Project Dataset Size (cleaned):** 46,837 rows
- **Number of attributes after preprocessing:** 17
- **Data Types Present:** character, integer, numeric, logical, POSIXct

### Attributes Used
- `id`
- `date`
- `primary_type`
- `description`
- `arrest`
- `domestic`
- `district`
- `beat`
- `community_area`
- `latitude`
- `longitude`
- `hour`
- `day`
- `month`
- `year`
- `weekday`
- `weekend`

## API Integration
The project uses the Socrata Open Data API to collect Chicago crime records directly from the public portal.

- **API Endpoint:** `https://data.cityofchicago.org/resource/ijzp-q8t2.json`
- **Method Used:** `GET`
- **Pagination Used:** `$limit` and `$offset`
- **Response Format:** JSON
- **Conversion:** JSON to R data frame using `jsonlite`

API-based ingestion was used to satisfy the project requirement for:
- live/open data usage
- pagination handling
- JSON to R data frame conversion

## Tools and Technologies
- **R**
- **RStudio**
- **Power BI Desktop**
- **GitHub**
- **Docker** (for final containerization phase)

## R Packages Used
- `httr`
- `jsonlite`
- `dplyr`
- `readr`
- `lubridate`
- `ggplot2`
- `randomForest`
- `caret`

## Project Structure
```text
predicting-crime-hotspots/
├── data/
│   ├── chicago_crime_raw.csv
│   └── chicago_crime_clean.csv
├── scripts/
│   ├── 01_data_collection.R
│   ├── 02_preprocessing.R
│   ├── 03_eda.R
│   └── 04_modeling.R
├── output/
│   ├── arrest_vs_nonarrest.png
│   ├── correlation_heatmap.png
│   ├── crimes_by_hour.png
│   ├── crimes_by_month.png
│   ├── hour_distribution.png
│   ├── latitude_boxplot.png
│   ├── logistic_regression_results.txt
│   ├── random_forest_results.txt
│   ├── top_10_crime_types.png
│   └── top_10_districts.png
├── dashboard/
│   └── crime_dashboard.pbix
├── screenshots/
├── README.md
└── .gitignore
