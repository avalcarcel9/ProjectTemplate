#' Data Generation Function
#'
#' @param iter number of iterations to run
#' @param n number of observations in a single iteration to generate for x and y
#' @param mu_x mean for x variable passed to rnorm
#' @param sd_x standard deviation for x variable passed to rnorm
#' @param mu_y mean for y variable passed to rnorm
#' @param sd_y standard deviation for y variable passed to rnorm
#' @param cores number of cores to run it on
#'
#' @return
#' @export
#' @importFrom broom tidy
#' @importFrom parallel mclapply
#' @importFrom stats lm rnorm
#' @importFrom stringr str_detect
#' @importFrom tibble tibble
#'
#' @examples
#' \dontrun{
#' library(broom)
#' library(parallel)
#' library(stringr)
#' library(tibble)
#' Run the function
#' data_generation(iter = 10000,
#'                 n = 1000,
#'                 mu_x = 23,
#'                 sd_x = 10,
#'                 mu_y = 9,
#'                 sd_y = 15,
#'                 cores = 1)
#'}



data_generation <- function(iter = 10000,
                            n = 1000,
                            mu_x = 23,
                            sd_x = 10,
                            mu_y = 9,
                            sd_y = 15,
                            cores = as.numeric(Sys.getenv('LSB_DJOB_NUMPROC'))){

  # If statement for setting a working directory locally versus on the cluster
  if(stringr::str_detect(getwd(), '/Users/alval')){
    setwd('/Users/alval/Box/rpackages/ProjectTemplate')
  } else if (stringr::str_detect(getwd(), '/project/taki')){
    setwd('/project/taki3/amv/ProjectTemplate')
  }

  single_iteration <- function(i){

    # Store randomly generated data in a tibble
    data = tibble::tibble(x = stats::rnorm(n = n, mean = mu_x, sd = sd_x),
                          y = stats::rnorm(n = n, mean = mu_y, sd = sd_y))

    # Check to see if a data folder already exists
    if(dir.exists(file.path('Data', 'normal_data')) == FALSE){
      # Create a data folder if it doesn't already exist
      message('Creating data directory to store results.')
      dir.create(file.path('Data', 'normal_data'))
    }

    # Save the data the Data folder
    save(data, file = file.path('Data', 'normal_data', paste0('normal_data_', iter, '.RData')))

    # Fit a linear model and save it as a
    linear_model = broom::tidy(stats::lm(y ~ x, data = data))

    # Check to see if a lm folder already exists
    if(dir.exists(file.path('Data', 'lm')) == FALSE){
      # Create a lm folder if it doesn't already exist
      message('Creating lm directory to store results.')
      dir.create(file.path('Data', 'lm'))
    }

    # Save the lm to a temporary file
    save(linear_model, file = file.path('Data', 'lm', paste0('lm_', iter, '.RData')))

    message(paste0('Finished iteration ', i))
  }

  parallel::mclapply(1:iter, single_iteration, mc.cores = cores)
}
