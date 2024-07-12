# Install necessary packages and libraries
install.packages("readxl")
install.packages("tidyverse")
install.packages("nortest")
install.packages("Metrics")
library(Metrics)
library(nortest)
library(dplyr)
library(ggplot2)
library(readxl)

# Load our SportData dataset
sportdata <- read_excel("3074863SportsPeople Data.xlsx")

# To view the top 6 of our dataset
head(sportdata)

# To view the bottom 6 of our dataset
tail(sportdata)

# To see all our column names in our dataset
colnames(sportdata)

# To show the shape of our dataset, both rows and columns
dim(sportdata)

# To view the structure of our dataset
str(sportdata)

# Check if there are missing values in each column
missing_value <- sapply(sportdata, function(x) sum(is.na(x)))

# Print out the number of missing values in each column
cat("Number of missing values in each column:", missing_value, "\n")

# To know the number of male and female sportpeople in our distribution
sex_distribution <- sportdata %>% count(Sex)
print(sex_distribution)

# View the statistical summary of our dataset
summary(sportdata)

# Histogram for LBM
ggplot(sportdata, aes(x = LBM)) +
  geom_histogram(bins = 30, fill = "blue", color = "black") +
  theme_minimal() +
  ggtitle("Distribution of Lean Body Mass (LBM)")

# Histogram for BMI
ggplot(sportdata, aes(x = BMI)) +
  geom_histogram(bins = 30, fill = "green", color = "black") +
  theme_minimal() +
  ggtitle("Distribution of Body Mass Index (BMI)")

# Boxplot for LBM by Sex
ggplot(sportdata, aes(x = Sex, y = LBM, fill = Sex)) +
  geom_boxplot() +
  theme_minimal() +
  ggtitle("LBM grouped by Sex")

# Boxplot for BMI by Sex
ggplot(sportdata, aes(x = Sex, y = BMI, fill = Sex)) +
  geom_boxplot() +
  theme_minimal() +
  ggtitle("BMI grouped by Sex")

# Anderson-Darling test for normality of LBM in males
ad.test(sportdata$LBM[sportdata$Sex == "male"])

# Histogram, QQnorm and QQline to show that it is normally distributed
hist(sportdata$LBM[sportdata$Sex == "male"])
qqnorm(sportdata$LBM[sportdata$Sex == "male"])
qqline(sportdata$LBM[sportdata$Sex == "male"])
plot(density(sportdata$LBM[sportdata$Sex == "male"]))

# Anderson-Darling test for normality of LBM in females
ad.test(sportdata$LBM[sportdata$Sex == "female"])

# Histogram, QQnorm and QQline to show that it is normally distributed
hist(sportdata$LBM[sportdata$Sex == "female"])
qqnorm(sportdata$LBM[sportdata$Sex == "female"])
qqline(sportdata$LBM[sportdata$Sex == "female"])
plot(density(sportdata$LBM[sportdata$Sex == "female"]))

# Test if the variances of LBM for males and females are equal
var.test(sportdata$LBM[sportdata$Sex == "male"], sportdata$LBM[sportdata$Sex == "female"])

# Welch's t-test to compare mean LBM between males and females
t.test(LBM ~ Sex, data = sportdata, var.equal = FALSE)

# Correlation for males both LBM & BMI
corr_male <- cor(sportdata$LBM[sportdata$Sex == "male"], sportdata$BMI[sportdata$Sex == "male"])

# Correlation for females both LBM & BMI
corr_female <- cor(sportdata$LBM[sportdata$Sex == "female"], sportdata$BMI[sportdata$Sex == "female"])

# Print out the correlation using cat()
cat("Correlation coefficient for males:", corr_male, "\n")

# Print out the female correlation coefficient
cat("Correlation coefficient for females:", corr_female, "\n")

# Modeling relationship between LBM and BMI for Males
model_male <- lm(LBM ~ BMI, data = sportdata[sportdata$Sex == "male",])

# The summary of the model is called using the summary()
summary(model_male)

# We can plot the residuals against the fitted values.
par(mfrow = c(2, 2))
plot(model_male)

# Formal test for significance of the overall model
anova(model_male)

# To predict the LBM for a male with a BMI of 25, we can use the model we fitted
predicted_lbm <- predict(model_male, newdata = data.frame(BMI = 25))
predicted_lbm

# Separating data by gender
male_data <- subset(sportdata, Sex == 'male')
female_data <- subset(sportdata, Sex == 'female')

# Predictions
predictions <- predict(model_male, newdata = male_data)

# RMSE and MAE provide measures of the model's predictive accuracy.
# Lower values indicate better performance.
# RMSE
rmse_value <- rmse(male_data$LBM, predictions)
rmse_value

# MAE
mae_value <- mae(male_data$LBM, predictions)
mae_value
