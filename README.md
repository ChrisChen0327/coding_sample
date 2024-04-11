# Coding sample introduction
## Rui_Chen_Coding Sample_R
This is the R coding from a Metric Exercise of the Big Data and Development Course. In this code, I delve into the analysis of a Harvest and Displacement working paper dataset of Afghanistan mobile data and some behavior pattern, and data regarding community trends and agricultural production. We start by doing exploratory analysis of the 2021 mobile device data, generating summary statistics and creating at least one informative visual representation. Potential trends to explore include user ping frequency, user drop-off patterns, time-of-day analysis, and behavioral changes around notable dates such as May 1 and August 15. 

Additionally, I draw the maps presented in the paper. The community trends and agricultural dataset includes violence data, provincial and district-level crop calendars, 2021 NDVI, 2020 and 2021 price data, takeover dates, and information on rainfed and irrigated cropland. We produce meaningful visualizations at the 2.5 x 2.5 km grid cell or district level to see 1) Agricultural Production and geographic distribution; 2) Whether Taliban takeover is happening in the harvest season; 3) Wheat production and average wheat price in year 2021

## STATA coding sample
# Analysis of the Influence of the Second Child Policy on Birth Behavior

## Overview

This project examines the impact of the Second Child Policy on the birth behavior of females using panel data from the CFPS (China Family Panel Studies) for the years 2010 to 2016. The analysis focuses on identifying changes in birth behavior patterns following the policy's implementation, employing various statistical methods to assess the effects.

## Data

The study utilizes panel data from CFPS for the years 2010 to 2016. The dataset contains detailed demographic, socioeconomic, and health-related variables for the participants.

## Methodology

The analysis employs a difference-in-differences (DID) approach, supplemented by logistic regression models to examine the influence of the Second Child Policy on birth behavior. The study focuses on women of childbearing age, excluding male participants and outliers beyond childbearing age.

### Key Steps:
- **Preparation:** Data cleaning and setting up the environment.
- **Variable Creation:** Generating new variables such as `incremental_children` to capture changes in the number of children post-policy, `policy_supportor` indicating support for the policy, and several dummy variables for analytical purposes.
- **Descriptive Statistics:** Summarizing the data to understand the distribution and central tendencies of key variables.
- **Modeling:** Applying pooled DID methods, fixed effects (FE) models, and logistic regression to estimate the policy's impact on birth behavior.
- **Analysis:** Detailed examination of birth behavior before and after the policy's implementation across various demographics and socioeconomic statuses.

## Code Structure

- **Housekeeping:** Initial setup for data analysis, including setting memory limits and opening a log file.
- **Data Preparation:** Reading and cleaning the dataset to ensure quality analysis.
- **Variable Generation and Data Cleaning:** Dropping irrelevant samples, generating new variables, and setting the panel data structure.
- **Statistical Analysis:** Conducting descriptive statistics, pooled DID analysis, fixed effects modeling, and logistic regression.
- **Results Documentation:** Using `asdoc` and `reg2docx` for exporting results into a user-friendly document.

## Author

CHEN Rui

## Date

15th July 2021

## Note

For detailed instructions on how to run the analysis and interpret the results, refer to the comments within the code files. This project provides insights into the societal implications of China's Second Child Policy on female birth behavior, contributing to the broader understanding of policy impacts on population dynamics.



## Rui_Chen_Coding Sample_R
This python code comes from my final project in "Marketing Analytics" course in my undergrad school. In this project, we obtain a dataset from open-source database of Instacart. The dataset contains a sample of over 3 million grocery orders from more than 200,000 Instacart users. Based on a Gradient Boosting Decision Tree model, this analysis would predict whether users will make repurchase decisions with their latest order in the test data. The GBDT is a kind of machine learning based on the decision tree model. We use the lightGBM framework to perform the GBDT model in this analysis since lightGBM has a faster training speed, better accuracy, and low occupation of computer storage space than XGBoosts. 

Since the last order of users is separated into the training and test datasets, we built the prediction model based on the training datasets for more accuracy. To get the reordering record of each order in the training datasets, we first merge the dataset of "orders.csv" and "order_product_train.csv", according to user id and product id, and then use the "test_train_splict" function and a fraction of 0.9 to separate the training and validate datasets. Then, based on the classification variables of "order_number", "order_dow", "order_hour_of_day", "days_since_prior_order", the lightGBM model would be used to perform the prediction. We chose the "order_number" variable since a larger number of orders could mean a higher loyalty level, which would positively correlate with repurchase behavior. Moreover, longer days since the prior order could also yield repurchase behavior. We classified probability > 0.5 as "reorder = 1", and "reorder" is a binary variable used for prediction. After adjusting the number of leaves (96) and maximum depth (10), and begging frequency of 5 to reduce the overfitting problem, we applied the model to the "validate" datasets and compared it with the actual reorder result. A relatively high f-score of 72.6% is detected. The result indicates that the model could have good predictive correctness. Eventually, the model is applied to the test datasets, and it shows that 52,713 users, among 75,000 in total, would have repurchase behavior in the latest order. This analysis would help Instacart better target and retain loyal consumers with repurchase behavior.

