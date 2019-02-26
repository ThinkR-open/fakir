
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

-   All tickets

``` r
library(fakir)
fake_ticket_client(vol = 10)
#> # A tibble: 10 x 25
#>    ref   num_client first last  job     age region id_dpt departement
#>    <chr> <chr>      <chr> <chr> <chr> <dbl> <chr>  <chr>  <chr>      
#>  1 DOSS… 31         Debi  Smith Film…    34 <NA>   94     Val-de-Mar…
#>  2 DOSS… 79         Josh… Murr… Cont…    40 <NA>   46     Lot        
#>  3 DOSS… 65         Dayne Mann  Educ…    18 <NA>   90     Territoire…
#>  4 DOSS… 77         Carl… Goye… Poli…    38 <NA>   70     Haute-Saône
#>  5 DOSS… 59         Cole  Lemke Musi…    39 <NA>   54     Meurthe-et…
#>  6 DOSS… 141        Betha Kuva… Adve…    30 Île-d… 78     Yvelines   
#>  7 DOSS… 182        Mrs.  Kile… Yout…    19 Poito… 16     Charente   
#>  8 DOSS… 69         Maxi… Sipes Engi…    27 Centre 28     Eure-et-Lo…
#>  9 DOSS… 120        Mari… Hoppe Cyto…    26 Prove… 13     Bouches-du…
#> 10 DOSS… 118        Mr.   Clem… Medi…    23 Poito… 86     Vienne     
#> # … with 16 more variables: cb_provider <chr>, name <chr>,
#> #   entry_date <dttm>, fidelity_points <dbl>, priority_encoded <dbl>,
#> #   priority <fct>, timestamp <date>, year <dbl>, month <dbl>, day <int>,
#> #   supported <chr>, supported_encoded <int>, type <chr>,
#> #   type_encoded <int>, state <fct>, source_call <fct>
```

-   Separate tickets and client databases

``` r
fake_ticket_client(vol = 10, split = TRUE)
#> $clients
#> # A tibble: 200 x 14
#>    num_client first last  job     age region id_dpt departement cb_provider
#>  * <chr>      <chr> <chr> <chr> <dbl> <chr>  <chr>  <chr>       <chr>      
#>  1 1          Sere… Dool… Medi…    78 Centre 45     Loiret      Diners Clu…
#>  2 2          Mrs.  Rich… Psyc…    34 Bourg… 58     Nièvre      Voyager    
#>  3 3          Dr.   Juli… Reta…    26 Basse… 61     Orne        Mastercard 
#>  4 4          Lucie Moen  Chie…    28 Corse  2A     Corse-du-S… JCB 16 dig…
#>  5 5          Hake… Kiehn Scie…    66 Rhône… 42     Loire       VISA 16 di…
#>  6 6          Mrs.  Lemp… Buye…    20 Poito… 16     Charente    VISA 13 di…
#>  7 7          Marg… Rowe  Mark…    63 Poito… 16     Charente    Mastercard 
#>  8 8          Jarv… Purdy Phar…    40 Aquit… 33     Gironde     VISA 16 di…
#>  9 9          Joan… Erns… Even…    48 Auver… 03     Allier      JCB 16 dig…
#> 10 10         Ms.   Made… Stru…    44 Langu… 34     Hérault     JCB 16 dig…
#> # … with 190 more rows, and 5 more variables: name <chr>,
#> #   entry_date <dttm>, fidelity_points <dbl>, priority_encoded <dbl>,
#> #   priority <fct>
#> 
#> $tickets
#> # A tibble: 10 x 10
#>    ref   num_client  year month   day timestamp  supported type  state
#>    <chr> <chr>      <dbl> <dbl> <int> <date>     <chr>     <chr> <fct>
#>  1 DOSS… 31          2016    11    26 2016-11-26 Non       Box   Atte…
#>  2 DOSS… 79          2017     9    21 2017-09-21 Oui       Box   Atte…
#>  3 DOSS… 65          2017    10    11 2017-10-11 Non       Ligne Term…
#>  4 DOSS… 77          2018     9     7 2018-09-07 Non       Box   En c…
#>  5 DOSS… 59          2018    10     3 2018-10-03 Non       Ligne Atte…
#>  6 DOSS… 141         2018    12    11 2018-12-11 Non       Ligne En c…
#>  7 DOSS… 182         2018    12    30 2018-12-30 Non       Ligne Atte…
#>  8 DOSS… 69          2019     1    16 2019-01-16 Oui       Ligne Atte…
#>  9 DOSS… 120         2019     2     4 2019-02-04 Oui       Box   Atte…
#> 10 DOSS… 118         2019     2    25 2019-02-25 Non       Box   Atte…
#> # … with 1 more variable: source_call <fct>
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

### Fake questionnaire on mean of transport / goal

-   All answers

``` r
fake_sondage_answers(n = 10)
#> # A tibble: 30 x 12
#>    id_individu   age sexe  region id_departement nom_departement
#>    <chr>       <int> <chr> <chr>  <chr>          <chr>          
#>  1 ID-OYCL-010    46 M     Midi-… 31             Haute-Garonne  
#>  2 ID-OYCL-010    46 M     Midi-… 31             Haute-Garonne  
#>  3 ID-OYCL-010    46 M     Midi-… 31             Haute-Garonne  
#>  4 ID-MXOJ-007    42 O     Poito… 79             Deux-Sèvres    
#>  5 ID-MXOJ-007    42 O     Poito… 79             Deux-Sèvres    
#>  6 ID-MXOJ-007    42 O     Poito… 79             Deux-Sèvres    
#>  7 ID-OFNB-003    55 O     Île-d… 78             Yvelines       
#>  8 ID-OFNB-003    55 O     Île-d… 78             Yvelines       
#>  9 ID-OFNB-003    55 O     Île-d… 78             Yvelines       
#> 10 ID-RMIX-009    30 F     Aquit… 24             Dordogne       
#> # … with 20 more rows, and 6 more variables: question_date <dttm>,
#> #   year <dbl>, type <chr>, distance_km <dbl>, transport <fct>,
#> #   temps_trajet_en_heures <dbl>
```

-   Separate individuals and their answers

``` r
fake_sondage_answers(n = 10, split = TRUE)
#> $individus
#> # A tibble: 10 x 8
#>    id_individu   age sexe  region id_departement nom_departement
#>    <chr>       <int> <chr> <chr>  <chr>          <chr>          
#>  1 ID-OYCL-010    46 M     Bourg… 21             Côte-d'Or      
#>  2 ID-MXOJ-007    42 O     Nord-… 62             Pas-de-Calais  
#>  3 ID-OFNB-003    55 O     Langu… 66             Pyrénées-Orien…
#>  4 ID-RMIX-009    30 F     Bourg… 71             Saône-et-Loire 
#>  5 ID-QGAW-001    37 M     Pays … 49             Maine-et-Loire 
#>  6 ID-WILB-005    59 M     Île-d… 93             Seine-Saint-De…
#>  7 ID-PDGN-006    71 F     Basse… 14             Calvados       
#>  8 ID-CJES-008    56 M     Franc… 70             Haute-Saône    
#>  9 ID-VGUJ-002    27 F     Poito… 17             Charente-Marit…
#> 10 ID-ACYV-004    49 M     Langu… 11             Aude           
#> # … with 2 more variables: question_date <dttm>, year <dbl>
#> 
#> $answers
#> # A tibble: 30 x 5
#>    id_individu type      distance_km transport temps_trajet_en_heures
#>    <chr>       <chr>           <dbl> <fct>                      <dbl>
#>  1 ID-OYCL-010 travail          6.09 mobylette                   0.72
#>  2 ID-OYCL-010 commerces        4.80 velo                        0.96
#>  3 ID-OYCL-010 loisirs        275.   train                       0.55
#>  4 ID-MXOJ-007 travail          6.09 mobylette                   0.72
#>  5 ID-MXOJ-007 commerces        4.80 velo                        0.96
#>  6 ID-MXOJ-007 loisirs        275.   train                       0.55
#>  7 ID-OFNB-003 travail          6.09 mobylette                   0.72
#>  8 ID-OFNB-003 commerces        4.80 velo                        0.96
#>  9 ID-OFNB-003 loisirs        275.   train                       0.55
#> 10 ID-RMIX-009 travail          6.09 mobylette                   0.72
#> # … with 20 more rows
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
