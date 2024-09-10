source("group_wise_regression.R")

load_user_data <- function(file_path) {
  if (file.exists(file_path)) {
    return(read.csv(file_path, header = TRUE))
  } else {
    stop("The file does not exist.")
  }
}

input_df <- NULL

# Example usage: Load data from a user-provided file path
input_file_path <- "path/to/your_data_file.csv"  # Set this to the path of your CSV file

# Try to load the user input data
input_df <- load_user_data(input_file_path)

# If there is no input data, create synthetic data for demonstration
if (is.null(input_df)) {
  set.seed(123)
  input_df <- data.frame(
    group = rep(c("A", "B", "C"), each = 5000),
    x1 = rnorm(15000, mean = 10, sd = 5),
    x2 = rnorm(15000, mean = 20, sd = 10),
    x3 = rnorm(15000, mean = 30, sd = 15),
    y = rnorm(15000, mean = 40, sd = 20)
  )
}

# Define the predictors and response variable
group_col <- "group"
predictors <- c("x1", "x2", "x3")  # Replace with your actual predictor columns
response <- "y"

# Run the group-wise regression
results_df <- group_wise_regression(input_df, group_col, predictors, response)

# Set to TRUE if you want to save the result as a CSV file
export_result <- FALSE

if (export_result) {
  # Export the results to a CSV file
  write.csv(results_df, file = "group_wise_regression_results.csv", row.names = FALSE)
}

# Print the results
print(results_df)
