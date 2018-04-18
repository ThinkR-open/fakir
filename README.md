
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

fakir
=====

The goal of {fakir} is to provide fake datasets that can be used to teach R.

Supported languages are, for now, French and US English.

Example
-------

### Fake support ticket base :

``` r
library(fakir)
fake_support_tickets(vol = 10)
#> # A tibble: 10 x 21
#>    num_client prenom  nom      job          age departement cb_provider   
#>    <chr>      <chr>   <chr>    <chr>      <int>       <int> <chr>         
#>  1 1          Christ… Robert   Ingénieur…    34          42 <NA>          
#>  2 2          Philip… Benoit   Technicie…    61          64 JCB 16 digit  
#>  3 3          Célina  Lesage   Assistant…    74          21 VISA 16 digit 
#>  4 4          Alain   Mercier  Guichetier    39          48 American Expr…
#>  5 5          Timoth… Martine… Céramiste     37          74 Mastercard    
#>  6 6          Isaac   de       Analyste …    27          95 Diners Club /…
#>  7 7          Étienne Turpin   Photograp…    55          74 Maestro       
#>  8 8          Timoth… Albert   Ingénieur     49          78 VISA 16 digit 
#>  9 9          Daniel  Couturi… Dresseur …    59          83 VISA 16 digit 
#> 10 10         Éléono… Collet   Auxiliair…    71          53 JCB 15 digit  
#> # ... with 14 more variables: points_fidelite <int>, an <int>, mois <int>,
#> #   jour <int>, timestamp <chr>, prise_en_charge <chr>,
#> #   prise_en_charge_encoded <int>, ref <chr>, type <chr>,
#> #   type_encoded <int>, etat <chr>, priorite <chr>,
#> #   priorite_encoded <int>, source_appel <chr>
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

Feel free to create new dataset to be added in "fakethis.R".

COC
---

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
