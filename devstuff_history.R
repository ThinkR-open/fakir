# Hide this file from build
usethis::use_build_ignore("devstuff_history.R")
usethis::use_build_ignore("img")
usethis::use_git_ignore("docs")
usethis::use_pipe()

# Doc
use_readme_rmd()
usethis::use_news_md()
usethis::use_mit_license(name = "ThinkR")
usethis::use_package_doc()
usethis::use_vignette("fake-client-database")

# dev
attachment::att_to_description(extra.suggests = c("pkgdown", "covr", "ggplot2"))
devtools::check()

# Readme and stuffs
use_readme_rmd()
use_mit_license(name = "Colin FAY")
use_lifecycle_badge("Experimental")
use_tidy_description()
use_code_of_conduct()

# CI
use_testthat()
use_test("support")
usethis::use_travis()
usethis::use_appveyor()
usethis::use_coverage()
usethis::use_pkgdown()
