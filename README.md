# Group-Wise Regression

## Overview

This repository contains a function and example script for performing linear regression on grouped data. The function `group_wise_regression` fits a linear model to each group within a dataset and returns the results as a data frame.

## Usage example

``` r {}
source("group_wise_regression.R")

# Load your data
input_df <- read.csv("path/to/your_data_file.csv", header = TRUE)

# Run the group-wise regression
results_df <- group_wise_regression(input_df, "group", "x", "y")

# Print the results
print(results_df)
```

## Function: `group_wise_regression`

### Description

`group_wise_regression` performs linear regression of `y` on `x` for each group in a specified column of a data frame. It returns a data frame with regression results, including estimates, standard errors, and p-values.

Arguments

    df: A data frame containing the data.
    group_col: The name of the column containing group identifiers.
    x_col: The name of the predictor variable.
    y_col: The name of the response variable.

Returns

A data frame with columns:

    group: The group identifier.
    term: The term in the regression model.
    estimate: The estimated coefficient.
    std.error: The standard error of the estimate.
    p.value: The p-value of the coefficient.


Here is an example of the regression results:

| group | term        | estimate   | std.error | p.value  |
|-------|-------------|------------|-----------|----------|
| A     | (Intercept) | 19.860426  | 0.318231  | 0.000000 |
| A     | x           | -0.012430  | 0.028501  | 0.662772 |
| B     | (Intercept) | 20.069443  | 0.317978  | 0.000000 |
| B     | x           | -0.016599  | 0.028473  | 0.559928 |
| C     | (Intercept) | 19.873613  | 0.314430  | 0.000000 |
| C     | x           | 0.008028   | 0.028027  | 0.774567 |