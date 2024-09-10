


# Function to perform regression with multiple predictors and return results as a data frame
group_wise_regression <- function(df, group_col, predictors, response) {
  # Create an empty list to store results
  results_list <- list()
  
  # Get unique groups
  groups <- unique(df[[group_col]])
  
  # Loop over each group and fit the model
  for (group in groups) {
    df_group <- df[df[[group_col]] == group, ]
    # Create the regression formula
    formula <- as.formula(paste(response, "~", paste(predictors, collapse = " + ")))
    model <- lm(formula, data = df_group)
    
    # Extract results and convert them to a data frame
    results_df <- data.frame(
      group = group,
      term = names(coef(model)),
      estimate = coef(model),
      std.error = summary(model)$coefficients[, "Std. Error"],
      p.value = summary(model)$coefficients[, "Pr(>|t|)"],
      stringsAsFactors = FALSE
    )
    
    # Append the results to the list
    results_list[[group]] <- results_df
  }
  
  # Combine all the group results into a single data frame
  final_results_df <- do.call(rbind, results_list)
  
  # Reset row names to avoid issues
  rownames(final_results_df) <- NULL
  
  return(final_results_df)
}