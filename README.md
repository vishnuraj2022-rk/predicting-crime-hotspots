# Crime Hotspot Prediction for Patrol Planning

This project aims to predict crime hotspot-prone areas and times in Chicago using historical crime data. By analyzing crime patterns, the project helps optimize police patrol planning by identifying locations and hours with a higher likelihood of crime. The project uses R for data collection, preprocessing, modeling, and Power BI Desktop for visualizations.

## Requirements

### R & R Packages

To run this project, you’ll need to have **R** installed on your system. This project uses the following R packages:

- `httr`
- `jsonlite`
- `dplyr`
- `readr`
- `lubridate`
- `ggplot2`
- `randomForest`
- `caret`

You can install these packages using the following commands in R:

```R
install.packages("httr")
install.packages("jsonlite")
install.packages("dplyr")
install.packages("readr")
install.packages("lubridate")
install.packages("ggplot2")
install.packages("randomForest")
install.packages("caret")

Power BI Desktop:
For dashboard visualization and interactive exploration, Power BI Desktop is used.

Docker (Optional):
Docker is used to containerize the project environment for easy deployment. This is optional but highly recommended for consistency across different systems.

GitHub (Optional)

For version control, the project is maintained on GitHub. Clone the repository using the following command:
git clone https://github.com/vishnuraj2022-rk/predicting-crime-hotspots.git

Installation Instructions
1.Clone the Repository (if you are working with GitHub):
git clone https://github.com/vishnuraj2022-rk/predicting-crime-hotspots.git

2.Install Dependencies:
Install the necessary R packages by running the commands mentioned in the Requirements section above.

3.Run R Scripts:

Open R or RStudio.
Run the 01_data_collection.R script to fetch the latest crime data from the API.
Execute 02_preprocessing.R to clean and preprocess the dataset.
Run 03_eda.R for exploratory data analysis (EDA) and visualization.
Run 04_modeling.R for training and evaluating the models (Logistic Regression and Random Forest).

Alternatively, you can run all scripts in sequence by executing: .\run_all.ps1

4.Power BI Dashboard:

Open the crime_dashboard.pbix file in Power BI Desktop.
The dashboard will show crime patterns, including visualizations for total crimes, arrests vs. non-arrests, crimes by hour, and more.
Customize filters (e.g., year, district, weekend) to explore the data interactively.

Project Structure:
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

Running in Docker (Optional)

1.Build Docker Image:
If you're using Docker, the Dockerfile is already configured to create the environment. Build the Docker image with:
docker build -t crime-hotspot-project .

2.Run Docker Container:
Run the container to execute the project environment and scripts:
docker run --rm crime-hotspot-project

3.Access Data:
You can access and analyze the crime data and results within the Docker container or copy the results to your local machine.

Output Explanation
Model Results
Logistic Regression: Evaluates the probability of a crime being a hotspot based on historical data. Performance metrics include accuracy, sensitivity, specificity, and balanced accuracy.
Random Forest: A tree-based model that classifies crime instances into hotspots or non-hotspots. Random Forest generally provides better performance in handling non-linear relationships and higher accuracy.

Both models provide statistics such as accuracy, specificity, sensitivity, and other metrics to compare model performance.

Power BI Dashboard:
Total Crimes: Displays the total number of crimes recorded.
Hot Hours Covered: Number of unique hours in which crimes occurred.
Crimes by Hour: Shows the frequency of crimes by hour, helping to identify peak crime hours.
Arrest vs Non-Arrest: A pie chart representing the percentage of crimes resulting in arrest vs those that did not.
Top 10 Crime Types: A bar chart showing the most frequent crime types.
Crimes by Month: A chart representing the frequency of crimes by month.


Contributing

If you want to contribute to this project:
1.Fork the repository.
2.Create a new branch (git checkout -b feature-name).
3.Make your changes and commit them (git commit -am 'Add new feature').
4.Push to the branch (git push origin feature-name).
5.Create a new pull request.

License
This project is licensed under the MIT License
