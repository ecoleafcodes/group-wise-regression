# Group-Wise Regression

## Overview

This repository contains a function and example script for performing linear regression on grouped data. The function `group_wise_regression` fits a linear model to each group within a dataset and returns the results as a data frame.

## Usage example

``` r {}
source("group_wise_regression.R")

# Load your data
input_df <- read.csv("path/to/your_data_file.csv", header = TRUE)

# Define the predictors and response variable
group_col <- "group"
predictors <- c("x1", "x2", "x3")  # Replace with your actual predictor columns
response <- "y"

# Run the group-wise regression
results_df <- group_wise_regression(input_df, group_col, predictors, response)

# Print the results
print(results_df)
```

## Function: `group_wise_regression`

### Description

`group_wise_regression` performs linear regression for each group, returning coefficients, standard errors, and p-values for each predictor.

Arguments

    df: A data frame containing the data.
    group_col: The name of the column containing group identifiers.
    predictors: A vector of column names representing the predictor variables.
    response: The name of the response variable.

Returns

A data frame with columns:

    group: The group identifier.
    term: The term in the regression model (predictors and intercept).
    estimate: The estimated coefficient.
    std.error: The standard error of the estimate.
    p.value: The p-value of the coefficient.


Here is an example of the regression results:

| group | term        | estimate     | std.error | p.value       |
|-------|-------------|--------------|-----------|---------------|
| A     | (Intercept) | 40.9501156886 | 1.03173254 | 1.048907e-299 |
| A     | x1          | -0.0484616643 | 0.05706858 | 3.958202e-01  |
| A     | x2          | 0.0022732936  | 0.02832028 | 9.360250e-01  |
| A     | x3          | 0.0002167269  | 0.01898319 | 9.908914e-01  |
| B     | (Intercept) | 40.9700082703 | 1.03577503 | 6.290212e-298 |
| B     | x1          | -0.0683579842 | 0.05697266 | 2.302590e-01  |
| B     | x2          | -0.0281257207 | 0.02830000 | 3.203481e-01  |
| B     | x3          | 0.0126161750  | 0.01901462 | 5.070419e-01  |
| C     | (Intercept) | 40.8571365387 | 1.02636885 | 3.072924e-301 |
| C     | x1          | -0.1483282594 | 0.05716335 | 9.491871e-03  |
| C     | x2          | 0.0234815283  | 0.02885131 | 4.157520e-01  |
| C     | x3          | 0.0170536329  | 0.01910791 | 3.721729e-01  |
