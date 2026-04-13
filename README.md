# Predicting Crime Hotspots for Patrol Planning Using Chicago Crime Data

## Project Overview
This project focuses on predicting crime hotspot-prone district-hour combinations using historical Chicago crime data. The objective is to support patrol planning by identifying areas and time periods with a higher likelihood of crime occurrence. The project follows an end-to-end data science workflow using R for data collection, preprocessing, exploratory analysis, and modeling, and Power BI Desktop for interactive dashboard creation.

## Problem Statement
Police patrol resources are limited, while crime patterns vary across districts, time periods, and offense categories. This project analyzes open Chicago crime records to identify hotspot patterns and classify district-hour combinations as hotspot or non-hotspot. The results can support better patrol allocation and data-driven urban safety planning.

## Objectives
- Collect crime records from a public open-data API
- Preprocess and clean the dataset in R
- Perform exploratory data analysis using multiple visualizations
- Engineer time-based features from the crime timestamp
- Build hotspot classification models
- Compare Logistic Regression and Random Forest performance
- Create an interactive Power BI dashboard with R visuals
- Maintain a version-controlled workflow using GitHub
- Demonstrate reproducibility using Docker

## Domain
Smart Cities / Public Safety / Urban Analytics

## Dataset Information
- **Dataset Source:** City of Chicago Data Portal – Crimes: 2001 to Present
- **Dataset Type:** Public open government dataset
- **Access Method:** Socrata Open Data API
- **Raw Dataset Size Used in Project:** 100,000 API-fetched records
- **Cleaned Dataset Size:** 85,281 rows
- **Number of attributes after preprocessing:** 17
- **Data types present:** character, integer, numeric, logical, datetime

## Attributes Used
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
The project uses the Socrata Open Data API to collect Chicago crime records directly from the public data portal.

- **API Endpoint:** `https://data.cityofchicago.org/resource/ijzp-q8t2.json`
- **HTTP Method:** `GET`
- **Pagination Used:** `$limit` and `$offset`
- **Response Format:** JSON
- **Conversion:** JSON to R data frame using `jsonlite`

API-based ingestion was used to satisfy the project requirement for:
- open/public data usage
- pagination handling
- JSON-to-data-frame conversion
- automated data collection workflow

## Data Preprocessing
The raw dataset was cleaned and transformed in R using the preprocessing script. The main preprocessing steps include:
- conversion of `date` into datetime format
- extraction of `hour`, `day`, `month`, `year`, and `weekday`
- creation of a `weekend` flag
- removal of rows with missing values in important time fields
- export of the cleaned dataset to CSV for further analysis and dashboarding

## Exploratory Data Analysis
EDA was performed in R and the following outputs were generated:
- crime count by hour
- crime count by month
- top 10 crime types
- top 10 districts
- arrest vs non-arrest comparison
- correlation heatmap
- latitude boxplot
- hour distribution histogram

These visualizations helped identify crime trends, seasonal patterns, and important hotspot-related characteristics.

## Modeling
The project uses supervised learning to classify district-hour combinations as hotspot or non-hotspot.

### Models Used
- Logistic Regression
- Random Forest

### Final Results
#### Logistic Regression
- **Accuracy:** 85.98%
- **Balanced Accuracy:** 78.99%
- **Sensitivity:** 65.38%
- **Specificity:** 92.59%

#### Random Forest
- **Accuracy:** 94.39%
- **Balanced Accuracy:** 92.38%
- **Sensitivity:** 88.46%
- **Specificity:** 96.30%

### Conclusion
Random Forest outperformed Logistic Regression in overall accuracy, balanced accuracy, and hotspot detection performance. Therefore, Random Forest was selected as the better final classifier for this project.

## Power BI Dashboard
An interactive dashboard was created in Power BI Desktop using the cleaned crime dataset.

### Dashboard Features
- Total Crimes KPI
- Total Districts KPI
- Hot Hours Covered KPI
- Crimes by Hour chart
- Crimes by Month chart
- Arrest vs Non-Arrest chart
- Top 10 Crime Types chart
- Filters for district, crime type, weekend, and year
- R visuals for:
  - crime distribution by hour
  - latitude outlier analysis

### Code-backed Power BI Components
The Power BI report is not only drag-and-drop based. It also uses:
- **Power Query M** for data loading and transformation
- **DAX measures** for KPI calculations
- **R visuals** for custom analytical charts

## Tools and Technologies
- **R**
- **RStudio**
- **Power BI Desktop**
- **VS Code**
- **GitHub**
- **Docker**

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
├── Dockerfile
├── .dockerignore
├── README.md
└── .gitignore
...
