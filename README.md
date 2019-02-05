
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

# fakir

The goal of {fakir} is to provide fake datasets that can be used to
teach R.

As it is designed for teaching data wrangling and data visualisation,
some datasets follow the tidy-data principles, other don’t.

Supported languages are, for now, French and US English.

## Example

### Fake support ticket base :

``` r
library(fakir)
fake_support_tickets(vol = 10)
#> # A tibble: 10 x 21
#>    num   first last  job     age   dep cb_provider points  year month   day
#>  * <fct> <chr> <chr> <fct> <int> <int> <fct>        <int> <int> <int> <int>
#>  1 1     Dera… Alte… Libr…    34    42 <NA>          6665  2010    11    13
#>  2 2     Dr.   Dion… Tour…    61    64 JCB 16 dig…   3857  2014     6    21
#>  3 3     Darv… Luei… Biom…    74    21 VISA 16 di…   6820  2013    11    17
#>  4 4     Alena Bogi… Info…    39    48 American E…     81  2013     4    17
#>  5 5     Thek… Steu… Engi…    37    74 Mastercard    2087  2012     9    15
#>  6 6     Ms.   Anni… Anim…    27    95 Diners Clu…   6985  2015     7    22
#>  7 7     Dovie Mertz Radi…    55    74 Maestro       9983  2011     9    25
#>  8 8     Dr.   Lidia Lect…    49    78 VISA 16 di…   4083  2013     9     2
#>  9 9     Mrs.  Rich… Fina…    59    83 VISA 16 di…   5992  2014     6     6
#> 10 10    Ferr… Hodk… Care…    71    53 JCB 15 dig…   1677  2011     6    14
#> # … with 10 more variables: timestamp <chr>, supported <fct>,
#> #   supported_encoded <int>, ref <fct>, type <fct>, type_encoded <int>,
#> #   state <fct>, priority <fct>, priority_encoded <int>, source <fct>
```

### Fake visits :

``` r
fake_visits(from = "2017-01-01", to = "2017-01-31")
#> # A tibble: 31 x 8
#>    timestamp   year month   day  home about  blog contact
#>  * <date>     <dbl> <dbl> <int> <int> <int> <int>   <int>
#>  1 2017-01-01  2017     1     1   352   184   673     434
#>  2 2017-01-02  2017     1     2   203   147   567      NA
#>  3 2017-01-03  2017     1     3   103    81   499     453
#>  4 2017-01-04  2017     1     4   484   281   582     181
#>  5 2017-01-05  2017     1     5   438   190   663     385
#>  6 2017-01-06  2017     1     6   209   116   455     310
#>  7 2017-01-07  2017     1     7   439   138   364     369
#>  8 2017-01-08  2017     1     8   273   151   514     358
#>  9 2017-01-09  2017     1     9   316   164   322     273
#> 10 2017-01-10  2017     1    10   193   103    NA     261
#> # … with 21 more rows
```

## Prior work

This package is heavily inspired by
[{charlatan}](https://github.com/ropensci/charlatan).

Scott Chamberlain (2017). charlatan: Make Fake Data. R package version
0.1.0. <https://CRAN.R-project.org/package=charlatan>

## Contribute

You can contribute to {fakir} in two ways:

### Translate

You can translate to other locales by providing :

  - new `vec` in “R/utils”
  - new `local` in “R/fakethis”

### New dataset

Feel free to create new dataset generators.

## COC

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
