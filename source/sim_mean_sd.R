#' sim_mean_sd
#' 
#' Simulates data and generates a df with the mean and sd
#' 
#' @param n_obs sample size
#' @param mu true mean
#' @param sigma true sd
#' 
#' @returns dataframe with mean and sd
#' 

# mu = 12 and sigma = 3 are DEFAULTS: used when the call doesn't supply them. `n_obs` has no default, so it must always be given.

sim_mean_sd = function(n_obs, mu = 12, sigma = 3) {
  
  # Simulate `n_obs` values from a normal distribution with the given mean and sd
  
  sim_df =
    tibble(
      x = rnorm(n = n_obs, mean = mu, sd = sigma)
    )
  
  # Calculate the SAMPLE mean and sd, which will be close to (but not exactly) mu and sigma
  
  return_df =                    # FIX: was originally "return_df |> sim_df |>"
    sim_df |>
    summarize(
      mean = mean(x),
      sd = sd(x)
    )
  
  return(return_df)
  
}