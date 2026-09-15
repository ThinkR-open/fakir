# Fake user feedbacks

Fake user feedbacks

## Usage

``` r
fake_user_feedback(
  n,
  seed = 2811,
  from = "2012-01-01 00:00:01",
  to = "2020-01-01 00:00:01"
)
```

## Arguments

- n:

  Number of feedbacks to generate

- seed:

  the random seed, default is 2811

- from, to:

  the date to cover

## Value

a dataframe

## Examples

``` r
fake_user_feedback(10)
#>                  user star                date
#> 1     Carlisle Cassin    4 2012-06-07 00:41:14
#> 2     Leeroy Beatty V    2 2016-06-13 23:47:37
#> 3  Dr. Talan Zieme MD    1 2016-11-23 08:50:08
#> 4    Sierra Hettinger    4 2019-02-27 22:30:40
#> 5       Ammon Dickens    2 2017-08-20 18:50:12
#> 6         Laney Adams    4 2018-06-06 04:40:47
#> 7    Jadiel Feest III    2 2017-11-03 00:46:52
#> 8       Cade Turcotte    3 2013-03-04 19:01:38
#> 9  Ophelia Wintheiser    1 2014-07-30 11:03:34
#> 10    Sydnee Nitzsche    1 2012-04-14 12:47:05
```
