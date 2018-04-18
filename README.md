
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

fakir
=====

The goal of {fakir} is to provide fake datasets that can be used to teach R.

As it is designed for teaching data wrangling and data visualisation, some datasets follow the tidy-data principles, other don't.

Supported languages are, for now, French and US English.

Example
-------

### Fake support ticket base :

``` r
library(fakir)
fake_support_tickets(vol = 10)
#> # A tibble: 10 x 21
#>    num   first  last   job       age   dep cb_provider  points  year month
#>    <chr> <chr>  <chr>  <chr>   <int> <int> <chr>         <int> <int> <int>
#>  1 1     Derald Alten… Librar…    34    42 <NA>           6665  2010    11
#>  2 2     Dr.    Dioni… Tour m…    61    64 JCB 16 digit   3857  2014     6
#>  3 3     Darvin Lueil… Biomed…    74    21 VISA 16 dig…   6820  2013    11
#>  4 4     Alena  Bogis… Inform…    39    48 American Ex…     81  2013     4
#>  5 5     Thekla Steub… Engine…    37    74 Mastercard     2087  2012     9
#>  6 6     Ms.    Annice Animal…    27    95 Diners Club…   6985  2015     7
#>  7 7     Dovie  Mertz  Radio …    55    74 Maestro        9983  2011     9
#>  8 8     Dr.    Lidia  Lectur…    49    78 VISA 16 dig…   4083  2013     9
#>  9 9     Mrs.   Riche… Financ…    59    83 VISA 16 dig…   5992  2014     6
#> 10 10    Ferris Hodki… Career…    71    53 JCB 15 digit   1677  2011     6
#> # ... with 11 more variables: day <int>, timestamp <chr>, supported <chr>,
#> #   supported_encoded <int>, ref <chr>, type <chr>, type_encoded <int>,
#> #   state <chr>, priority <chr>, priority_encoded <int>, source <chr>
```

### Fake visits :

``` r
fake_visits(from = "2017-01-01", to = "2017-01-10")
#> # A tibble: 10 x 8
#>    timestamp   year month   day  home about  blog contact
#>    <date>     <dbl> <dbl> <int> <int> <int> <int>   <int>
#>  1 2017-01-01 2017.    1.     1   352   189   535     138
#>  2 2017-01-02 2017.    1.     2   203    68   353     415
#>  3 2017-01-03 2017.    1.     3   103    55   411     357
#>  4 2017-01-04 2017.    1.     4   484    71   538     278
#>  5 2017-01-05 2017.    1.     5   438    76   494     211
#>  6 2017-01-06 2017.    1.     6   209   282   672     221
#>  7 2017-01-07 2017.    1.     7   439   264   535     296
#>  8 2017-01-08 2017.    1.     8   273   136   472     482
#>  9 2017-01-09 2017.    1.     9   316   168   336      95
#> 10 2017-01-10 2017.    1.    10   193    66   449     271
```

Prior work
----------

This package is heavily inspired by [{charlatan}](https://github.com/ropensci/charlatan).

Scott Chamberlain (2017). charlatan: Make Fake Data. R package version 0.1.0. <https://CRAN.R-project.org/package=charlatan>

Contribute
----------

You can contribute to {fakir} in two ways:

### Translate

You can translate to other locales by providing :

-   new `vec` in "R/utils"
-   new `local` in "R/fakethis"

### New dataset

Feel free to create new dataset generators.

COC
---

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
