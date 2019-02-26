# Hide this file from build
usethis::use_build_ignore("devstuff_history.R")

usethis::use_pipe()

use_readme_rmd()
usethis::use_news_md()
usethis::use_mit_license(name = "ThinkR")

# dev
attachment::att_to_description(dir.v = "")
devtools::check()

# Readme and stuffs
use_readme_rmd()
use_mit_license(name = "Colin FAY")
use_lifecycle_badge("Experimental")
use_tidy_description()
use_code_of_conduct()

use_testthat()
use_test("support")
