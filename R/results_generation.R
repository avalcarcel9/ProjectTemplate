

results_generation <- function(compile = TRUE){
  if(compile == TRUE){
    # Compile and load the normal data
    normal_data = aliviateR::load_mrdata(path = file.path('Data', 'normal_data'), pattern = '.RData')
    # Compile and laod the linear models
    lm_data = aliviateR::load_mrdata(path = file.path('Data', 'lm'), pattern = '.RData')
    # dir create an all results




  }

  # if compile is false just load the data
  # then make a figure and a table
  # return them
}
