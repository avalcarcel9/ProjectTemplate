
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ProjectTemplate

<!-- badges: start -->

[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/avalcarcel9/ProjectTemplate?branch=master&svg=true)](https://ci.appveyor.com/project/avalcarcel9/ProjectTemplate)
[![Travis build
status](https://travis-ci.org/avalcarcel9/ProjectTemplate.svg?branch=master)](https://travis-ci.org/avalcarcel9/ProjectTemplate)
[![Codecov test
coverage](https://codecov.io/gh/avalcarcel9/ProjectTemplate/branch/master/graph/badge.svg)](https://codecov.io/gh/avalcarcel9/ProjectTemplate?branch=master)
<!-- badges: end -->

The goal of ProjectTemplate is to create a template for project
workflows in the PennSIVE working group.

## Installation

You can install the released version of ProjectTemplate from
[GitHub](https://github.com/avalcarcel9/ProjectTemplate) with:

``` r
install.packages("ProjectTemplate")
#> 
#> The downloaded binary packages are in
#>  /var/folders/sq/x3htb34928bfn79jk3qksqg56zmf39/T//RtmpifMIAJ/downloaded_packages
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("avalcarcel9/ProjectTemplate")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ProjectTemplate)
#> Warning: package 'ProjectTemplate' was built under R version 3.5.2
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!
