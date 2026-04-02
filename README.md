# Predicting Crime Hotspots for Patrol Planning Using Chicago Crime Data

## Project Overview
This project analyzes historical Chicago crime records to identify hotspot-prone areas and high-risk time windows for patrol planning. The workflow uses open government crime data, API-based data collection in R, preprocessing, exploratory data analysis, classification modeling, and Power BI dashboard visualization.

## Problem Statement
Police patrol resources are limited, and crime patterns vary across locations and time periods. This project aims to predict hotspot-prone district-hour combinations using historical crime data so that patrol planning can focus on high-risk areas and time windows.

## Dataset Source
- **Dataset:** City of Chicago Data Portal – Crimes: 2001 to Present
- **Type:** Public open government dataset
- **Format used:** JSON via API, converted to CSV for analysis
- **Rows used after collection:** 50000 raw rows
- **Rows used after preprocessing:** 46837 cleaned rows
- **Attributes used:** id, date, primary_type, description, arrest, domestic, district, beat, community_area, latitude, longitude, hour, day, month, year, weekday, weekend

## API Used
- **API source:** City of Chicago / Socrata Open Data API
- **Endpoint used:** `https://data.cityofchicago.org/resource/ijzp-q8t2.json`
- **Method:** Pagination using `$limit` and `$offset`
- **Purpose:** Collect crime records directly from the public data portal into R

## Tools and Technologies
- **R**
- **RStudio**
- **Power BI Desktop**
- **GitHub**
- **Docker** (to be added for containerization)

## Project Structure
```text
predicting-crime-hotspots/
├── data/
├── scripts/
│   ├── 01_data_collection.R
│   ├── 02_preprocessing.R
│   ├── 03_eda.R
│   └── 04_modeling.R
├── output/
├── dashboard/
├── screenshots/
├── README.md
└── .gitignore
