# Exploratory Data Analysis and Statistical Modeling of SportsPeople Dataset

This repository contains the R code and project report for the MATPMDA course project at the University of Stirling. The project involves performing exploratory data analysis and statistical modeling on a dataset of sportspeople, focusing on the relationship between Lean Body Mass (LBM) and Body Mass Index (BMI).

## Project Overview

### 1. Exploratory Data Analysis
- **Data Description**: The dataset consists of three variables: Sex (categorical), LBM (continuous), and BMI (continuous).
- **Steps**:
  - Installation and loading of necessary R packages.
  - Examination of dataset structure, dimensions, and missing values.
  - Summary statistics and visualizations (histograms and boxplots) to understand data distribution and relationships.

### 2. Statistical Tests and Analysis
- **Normality Tests**: Anderson-Darling test for normality of LBM in males and females.
- **Variance Test**: F-test to check the equality of variances for LBM between males and females.
- **T-tests**: Welch’s t-test to compare mean LBM between males and females.

### 3. Correlation Analysis
- Calculation of correlation coefficients between LBM and BMI for male and female sportspeople.

### 4. Linear Regression Modeling
- **Model Description**: Simple linear regression model to predict LBM based on BMI for male sportspeople.
- **Model Evaluation**: Summary statistics, ANOVA, residual analysis, and prediction performance (RMSE and MAE).

### 5. Predictions
- Using the fitted model to predict LBM for a given BMI value.

## Files in the Repository
- `MATPMDAProjectSubmissionForm3074863.pdf`: The project report detailing the analysis, results, and conclusions.
- `analysis_code.R`: The R script containing all the code used for the data analysis and modeling.

## Getting Started
To run the analysis on your local machine, ensure you have the necessary R packages installed. You can use the following commands to install them:

```r
install.packages("readxl")
install.packages("tidyverse")
install.packages("nortest")
install.packages("Metrics")
```

Load the required libraries and run the provided R script:

```r
library(Metrics)
library(nortest)
library(dplyr)
library(ggplot2)
library(readxl)

# Load the dataset
sportdata <- read_excel("3074863SportsPeople Data.xlsx")

# Perform exploratory data analysis, statistical tests, and modeling
source("analysis_code.R")
```

## Results and Conclusions
The analysis revealed significant differences in LBM between male and female sportspeople. The linear regression model demonstrated a strong relationship between BMI and LBM for males, with BMI being a strong predictor of LBM.

## References
- [Statology: Exploratory Data Analysis in R](https://www.statology.org/exploratory-data-analysis-in-r/)
- [West Georgia University: Linear Regression Notes](https://www.westga.edu/academics/research/vrc/assets/docs/linear_regression_notes.pdf)
- [Udemy: R Programming A-Z™](https://www.udemy.com/course/r-programming/learn/lecture/4652008#overview)
- Course materials from the University of Stirling

## Author
- Michael Salami
