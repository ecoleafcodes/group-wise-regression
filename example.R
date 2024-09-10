

source("group_wise_regression.R")


load_user_data <- function(file_path) {
  if (file.exists(file_path)) {
    return(read.csv(file_path, header=TRUE))
  } else {
    stop("The file does not exist.")
  }
}

input_df <- NULL

# Example usage: Load data from a user-provided file path
input_file_path <- "path/to/your_data_file.csv"  # Set this to the path of your CSV file

# Try load the user input data
input_df <- load_user_data(input_file_path)

# If there is no input data, create a synthetic data for demonstration
if (is.null(input_df)) {
  set.seed(123)
  input_df <- data.frame(
    group = rep(c("A", "B", "C"), each = 5000),
    x = rnorm(15000, mean = 10, sd = 5),
    y = rnorm(15000, mean = 20, sd = 10)
  )
}


# Run the algorithm
results_df <- group_wise_regression(input_df, "group", "x", "y")

# Set to TRUE if you want to save the result as a df
export_result <- FALSE

if (export_result == TRUE) {
  # Export the results to a CSV file
  write.csv(results_df, file = "group_wise_regression_results.csv", row.names = FALSE)
}

print(results_df)
