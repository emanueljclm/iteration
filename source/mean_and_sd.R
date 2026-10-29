#' mean_and_sd
#' 
#' This function computes the mean and sd of an input vector
#' 
#' @param x input numeric vector
#' 
#' @returns dataframe with mean and sd
#' 
# (#' lines are "roxygen" documentation: a standard format for describing what a function does, its inputs (@param), and its output (@returns))

mean_and_sd = function(x) {   # FIX: was initially named `z_scores` in class
  
  # Same input checks as `z_scores()`: stop with an error if x isn't usable
  
  if (!is.numeric(x)) {
    stop("Input x must be numeric")
  } else if(length(x) < 5) {
    stop("x should have 5 or more numbers")
  }
  
  # `tibble()` builds a one-row dataframe holding both results, since a function can only return ONE object
  
  return_df =
    tibble(
      mean = mean(x),
      sd = sd(x)
    )
  
  return(return_df)
  
}