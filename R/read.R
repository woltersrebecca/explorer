#' readclariostar
#'
#' Reads the plates from the clariostar plate reader. Hooray!
#'
#' @param file_path File path to the .csv file from the clariostar.
#'
#' @return a tibble with 3 columns, time, well and od600
#' @export
#'
#' @examples
read_96_clariostar <- function(file_path){

  df <- readr::read_csv(file_path)

  df <- df |>
    janitor::clean_names() |>
    dplyr::rename(time = 2) |>
    dplyr::select(-1) |>
    dplyr::slice(-1) |>
    tidyr::pivot_longer(-time) |>
    dplyr::mutate(value = as.numeric(value),
           time = as.numeric(time)) |>
    dplyr::rename( od600 = value,  well = name)


  return(df)
}
