
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fakir <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/ThinkR-open/fakir/branch/master/graph/badge.svg)](https://app.codecov.io/gh/ThinkR-open/fakir?branch=master)
[![R-CMD-check](https://github.com/ThinkR-open/fakir/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ThinkR-open/fakir/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

The goal of `{fakir}` is to provide fake datasets that can be used for
prototyping or teaching purpose.

The full documentation is in this `{pkgdown}`site:
<https://thinkr-open.github.io/fakir/>.

`{fakir}` is part of the [golemverse](https://golemverse.org/).

## About

You’re reading the doc about version : 1.0.0

This README has been compiled on the

``` r
Sys.time()
```

    [1] "2023-04-06 09:24:34 CEST"

Here are the test & coverage results :

``` r
devtools::check(quiet = TRUE)
```

    ── R CMD check results ──────────────────────────────────────── fakir 1.0.0 ────
    Duration: 28.2s

    0 errors ✔ | 0 warnings ✔ | 0 notes ✔

``` r
covr::package_coverage()
```

    fakir Coverage: 94.78%

    R/utils.R: 86.96%

    R/fake_transport.R: 89.89%

    R/fake_client.R: 93.48%

    R/fake_products.R: 100.00%

    R/fake_web.R: 100.00%

## Installation

You can install the released version of `{fakir}` from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("fakir")
```

Or the development version from GitHub with:

``` r
# From r-universe.dev (No need for GITHUB_PAT)
install.packages(
  "fakir",
  repos = c("thinkropen" = "https://thinkr-open.r-universe.dev")
)

# With {remotes} using GitHub API
# install.packages("remotes")
remotes::install_github("ThinkR-open/fakir")
```

## Characteristics & usage

This package is designed for simulating real life datasets:

- some datasets follow the tidy-data principles, others don’t.
- Some missing values are set for numeric and categorical variables
- Some variables values are correlated

Supported languages are, for now, French and US English.

See the Vignette for examples.

## Prior work

This package is heavily inspired by
[{charlatan}](https://github.com/ropensci/charlatan).

Scott Chamberlain (2017). charlatan: Make Fake Data. R package version
0.1.0. <https://CRAN.R-project.org/package=charlatan>

## Contribute

You can contribute to `{fakir}` in two ways:

### Translate

You can translate to other locales by providing :

- new `vec` in “R/utils”
- new `local` in “R/fake_client” and “R/fake_transport”

### New dataset

Feel free to create new datasets generators.

## Code of Conduct

Please note that the fakir project is released with a [Contributor Code
of
Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/).
By contributing to this project, you agree to abide by its terms.
