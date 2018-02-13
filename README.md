
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fakethis

Génération de faux jeux de données

## Example

``` r
library(fakethis)
fausse_base_ticket_client(vol = 10)
#> # A tibble: 10 x 21
#>    num_client Prénom  Nom      job          age departement cb_provider   
#>  * <chr>      <chr>   <chr>    <chr>      <int>       <int> <chr>         
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
#> # ... with 14 more variables: point_fidelite <int>, an <int>, mois <int>,
#> #   jour <int>, timestamp <chr>, prise_en_charge <chr>,
#> #   prise_en_charge_encoded <int>, ref <chr>, type <chr>,
#> #   type_encoded <int>, etat <chr>, priorite <chr>,
#> #   priorite_encoded <int>, source_appel <chr>
```
