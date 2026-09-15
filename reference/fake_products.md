# Fake base of products

Fake base of products

## Usage

``` r
fake_products(n, seed = 2811)
```

## Arguments

- n:

  Number of Products to generate

- seed:

  the random seed, default is 2811

## Value

a dataframe

A dataframe of fake products.

## Examples

``` r
fake_products(10)
#> # A tibble: 10 × 8
#>    name                 brand color price body_location category sent_from    id
#>    <chr>                <chr> <chr> <int> <chr>         <chr>    <chr>     <int>
#>  1 Step and Distance P… Keeb… Teal      2 Torso         Medical  United S…     1
#>  2 Biking Tracker U Pr… Dick… Gree…     9 Brain         Medical  South Ko…     2
#>  3 Wearable Transmitte… Effe… Blan…     5 Chest         Lifesty… China         3
#>  4 Multifunction Track… Weim… Dark…     3 Chest         Gaming   United S…     4
#>  5 Action Camera Pro    Lind… Medi…    10 Chest         Industr… Austria       5
#>  6 Strapless Heart Rat… Sawa… Pale…     1 Feet          Pets an… South Ko…     6
#>  7 Action Camera RE Pr… Leus… Medi…    10 Brain         Fitness  China         7
#>  8 Microcontroller ES   Weim… Fire…     3 Arms          Awesome  France        8
#>  9 Microcontroller OGB… Chri… Ligh…     1 Chest         Awesome  Italy         9
#> 10 Wearable AUSG with … Sawa… Bisq…     7 Waist         Medical  Canada       10
```
