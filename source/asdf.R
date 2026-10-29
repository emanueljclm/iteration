#' lotr_import
#' 
#' Extract word data from the `LotR_Words` excel file. 
#'
#' @param cell_range cell range for movie
#' @param movie_title name of movie
#'
#' @returns imported / cleaned dataset
#'

# The steps that were copied three times (once per movie) now live in one function; only the inputs that differ between movies (cell range and title) become arguments

lotr_import = function(cell_range, movie_title) {
  
  lotr_df =
    read_excel("data/LotR_Words.xlsx", range = cell_range) |>   # read one movie's block of cells
    mutate(movie = movie_title) |>                              # label every row with the movie
    janitor::clean_names() |>
    pivot_longer(                                               # one row per race x sex
      female:male,
      names_to = "sex",
      values_to = "words"
    ) |>
    select(movie, everything())                                 # move movie to the first column
  
  return(lotr_df)   # FIX: was originally `lotr_movie_df`
  
}