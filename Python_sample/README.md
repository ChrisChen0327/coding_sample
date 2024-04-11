# Instacart Repurchase Behavior Prediction

## Introduction

This project represents the culmination of my work in the "Marketing Analytics" course during my undergraduate studies. It focuses on analyzing a dataset from the open-source database of Instacart, comprising over 3 million grocery orders from more than 200,000 users. The goal is to predict the likelihood of users making repurchase decisions with their latest order using a machine learning model.

## Dataset

The dataset includes a comprehensive sample of grocery orders placed on Instacart. Key details include:
- Over 3 million grocery orders.
- Data from more than 200,000 Instacart users.
- Information contained in `orders.csv` and `order_product_train.csv` files.

## Objective

To predict whether users will repurchase in their latest order, employing a Gradient Boosting Decision Tree (GBDT) model facilitated by the lightGBM framework. This approach was chosen for its efficiency in training speed, accuracy, and minimal storage requirements compared to alternatives like XGBoost.

## Methodology

The analysis follows these steps:
1. **Data Preparation:** Merging `orders.csv` and `order_product_train.csv` based on user ID and product ID.
2. **Dataset Splitting:** Utilizing the `test_train_split` function with a fraction of 0.9 to separate training and validation datasets.
3. **Model Training:** Using the lightGBM model to predict repurchase behavior based on variables such as `order_number`, `order_dow`, `order_hour_of_day`, and `days_since_prior_order`.
4. **Parameter Tuning:** Adjusting model parameters like the number of leaves and maximum depth to mitigate overfitting.
5. **Validation:** Applying the model to the validation dataset and comparing predictions against actual reorder outcomes to evaluate performance.
6. **Prediction:** Final application of the model to the test dataset to predict repurchase behavior.

## Key Findings

- The model achieved a relatively high F-score of 72.6%, indicating good predictive accuracy.
- Predictions on the test dataset suggest that 52,713 out of 75,000 users (about 70%) are likely to exhibit repurchase behavior in their latest order.

## Conclusion

The findings from this project provide valuable insights into user repurchase behavior on Instacart, highlighting the potential for targeted marketing strategies aimed at retaining loyal consumers. The successful application of the lightGBM model underscores the efficacy of machine learning in predicting consumer behavior in the e-commerce domain.


## Author

[Your Name]

## Date

[Completion Date of the Project]

## Acknowledgments

I extend my gratitude to the instructors and peers in the "Marketing Analytics" course for their guidance and support throughout this project.

