library(devtools)
library(usethis)

library(charlatan)
library(glue)
library(withr)
library(tidyr)
library(dplyr)
library(attempt)

# dependencies
use_package("charlatan")
use_package("glue")
use_package("withr")
use_package("tibble")
use_package("tidyr")
use_package("dplyr")
use_package("magrittr")
use_package("attempt")
use_package("lubridate")

# Readme and stuffs
use_readme_rmd()
use_mit_license(name = "Colin FAY")
use_lifecycle_badge("Experimental")
use_tidy_description()
use_code_of_conduct()

use_testthat()
use_test("support")
