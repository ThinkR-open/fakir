# Create a fake support ticket base

Create a fake support ticket base

## Usage

``` r
fake_visits(
  from = "2017-01-01",
  to = "2017-12-31",
  local = c("en_US", "fr_FR"),
  seed = 2811
)
```

## Arguments

- from, to:

  the date to cover

- local:

  the local of the base. Currently supported : "fr_FR" and "en_US".

- seed:

  fixe la graine aleatoire

## Value

A dataframe of fake web visits.

## Examples

``` r
fake_visits()
#> # A tibble: 365 × 8
#>    timestamp   year month   day  home about  blog contact
#>  * <date>     <dbl> <dbl> <int> <int> <int> <int>   <int>
#>  1 2017-01-01  2017     1     1    NA    64   446     145
#>  2 2017-01-02  2017     1     2   159   102   487     250
#>  3 2017-01-03  2017     1     3    NA    59   479     433
#>  4 2017-01-04  2017     1     4   123   202   601     109
#>  5 2017-01-05  2017     1     5   362   162   311     378
#>  6 2017-01-06  2017     1     6    NA   244   450     350
#>  7 2017-01-07  2017     1     7    NA   298   343     232
#>  8 2017-01-08  2017     1     8   461   121   389     122
#>  9 2017-01-09  2017     1     9   337   171    NA     150
#> 10 2017-01-10  2017     1    10   155   151   515      NA
#> # ℹ 355 more rows
```
