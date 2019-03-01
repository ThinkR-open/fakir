
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
#>  1 DOSS… 31         Debi  Smith Film…    34 Midi-… 81     Tarn       
#>  2 DOSS… 79         Josh… Murr… Cont…    40 Île-d… 95     Val-d'Oise 
#>  3 DOSS… 65         Dayne Mann  Educ…    18 Auver… 03     Allier     
#>  4 DOSS… 77         Carl… Goye… Poli…    38 Pays … 49     Maine-et-L…
#>  5 DOSS… 59         Cole  Lemke Musi…    39 Centre 18     Cher       
#>  6 DOSS… 141        Betha Kuva… Adve…    30 Île-d… 91     Essonne    
#>  7 DOSS… 182        Mrs.  Kile… Yout…    19 Poito… 86     Vienne     
#>  8 DOSS… 69         Maxi… Sipes Engi…    27 Langu… 66     Pyrénées-O…
#>  9 DOSS… 120        Mari… Hoppe Cyto…    26 Aquit… 47     Lot-et-Gar…
#> 10 DOSS… 118        Mr.   Clem… Medi…    23 Lorra… 57     Moselle    
#> # … with 16 more variables: cb_provider <chr>, name <chr>,
#> #   entry_date <dttm>, fidelity_points <dbl>, priority_encoded <dbl>,
#> #   priority <fct>, timestamp <date>, year <dbl>, month <dbl>, day <int>,
#> #   supported <chr>, supported_encoded <int>, type <chr>,
#> #   type_encoded <int>, state <fct>, source_call <fct>
```

-   Separate tickets and client databases

``` r
tickets_db <- fake_ticket_client(vol = 100, split = TRUE)
tickets_db
#> $clients
#> # A tibble: 200 x 14
#>    num_client first last  job     age region id_dpt departement cb_provider
#>  * <chr>      <chr> <chr> <chr> <dbl> <chr>  <chr>  <chr>       <chr>      
#>  1 1          Sere… Dool… Medi…    78 Île-d… 75     Paris       Diners Clu…
#>  2 2          Mrs.  Rich… Psyc…    34 Pays … 72     Sarthe      Voyager    
#>  3 3          Dr.   Juli… Reta…    26 Prove… 84     Vaucluse    Mastercard 
#>  4 4          Lucie Moen  Chie…    28 Rhône… 73     Savoie      JCB 16 dig…
#>  5 5          Hake… Kiehn Scie…    66 Pays … 72     Sarthe      VISA 16 di…
#>  6 6          Mrs.  Lemp… Buye…    20 Langu… 30     Gard        VISA 13 di…
#>  7 7          Marg… Rowe  Mark…    63 Franc… 25     Doubs       Mastercard 
#>  8 8          Jarv… Purdy Phar…    40 <NA>   50     Manche      VISA 16 di…
#>  9 9          Joan… Erns… Even…    48 <NA>   89     Yonne       JCB 16 dig…
#> 10 10         Ms.   Made… Stru…    44 Poito… 86     Vienne      JCB 16 dig…
#> # … with 190 more rows, and 5 more variables: name <chr>,
#> #   entry_date <dttm>, fidelity_points <dbl>, priority_encoded <dbl>,
#> #   priority <fct>
#> 
#> $tickets
#> # A tibble: 100 x 10
#>    ref   num_client  year month   day timestamp  supported type  state
#>    <chr> <chr>      <dbl> <dbl> <int> <date>     <chr>     <chr> <fct>
#>  1 DOSS… 4           2015     2     3 2015-02-03 Non       <NA>  Term…
#>  2 DOSS… 6           2015     4    25 2015-04-25 Oui       <NA>  Inte…
#>  3 DOSS… 1           2016     3    10 2016-03-10 Non       Ligne Term…
#>  4 DOSS… 8           2016     3    10 2016-03-10 Non       Box   Inte…
#>  5 DOSS… 37          2016     6    27 2016-06-27 Non       Ligne En c…
#>  6 DOSS… 29          2016     7    11 2016-07-11 Non       Ligne Inte…
#>  7 DOSS… 37          2016     8    21 2016-08-21 Oui       Ligne Atte…
#>  8 DOSS… 1           2016    10    13 2016-10-13 Oui       <NA>  Term…
#>  9 DOSS… 9           2017     1     5 2017-01-05 Oui       Box   Term…
#> 10 DOSS… 24          2017     1    15 2017-01-15 Oui       Box   Atte…
#> # … with 90 more rows, and 1 more variable: source_call <fct>
ggplot(tickets_db$clients) +
  aes(entry_date, fidelity_points) +
  geom_point() +
  geom_smooth()
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r
ggplot(tickets_db$tickets) + aes(type) + geom_bar()
```

<img src="man/figures/README-unnamed-chunk-2-2.png" width="100%" />

``` r
ggplot(tickets_db$tickets) + aes(state) + geom_bar()
```

<img src="man/figures/README-unnamed-chunk-2-3.png" width="100%" />

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
#>  1 ID-OYCL-010    56 M     Limou… 23             Creuse         
#>  2 ID-OYCL-010    56 M     Limou… 23             Creuse         
#>  3 ID-OYCL-010    56 M     Limou… 23             Creuse         
#>  4 ID-MXOJ-007    51 O     Basse… 61             Orne           
#>  5 ID-MXOJ-007    51 O     Basse… 61             Orne           
#>  6 ID-MXOJ-007    51 O     Basse… 61             Orne           
#>  7 ID-OFNB-003    67 O     Midi-… 31             Haute-Garonne  
#>  8 ID-OFNB-003    67 O     Midi-… 31             Haute-Garonne  
#>  9 ID-OFNB-003    67 O     Midi-… 31             Haute-Garonne  
#> 10 ID-RMIX-009    35 F     Aquit… 47             Lot-et-Garonne 
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
#>  1 ID-OYCL-010    56 M     Picar… 02             Aisne          
#>  2 ID-MXOJ-007    51 O     Centre 28             Eure-et-Loir   
#>  3 ID-OFNB-003    67 O     Île-d… 78             Yvelines       
#>  4 ID-RMIX-009    35 F     Auver… 63             Puy-de-Dôme    
#>  5 ID-QGAW-001    44 M     Breta… 35             Ille-et-Vilaine
#>  6 ID-WILB-005    73 M     Haute… 27             Eure           
#>  7 ID-PDGN-006    90 F     Centre 36             Indre          
#>  8 ID-CJES-008    69 M     Langu… 66             Pyrénées-Orien…
#>  9 ID-VGUJ-002    30 F     Corse  2A             Corse-du-Sud   
#> 10 ID-ACYV-004    59 M     Breta… 56             Morbihan       
#> # … with 2 more variables: question_date <dttm>, year <dbl>
#> 
#> $answers
#> # A tibble: 30 x 5
#>    id_individu type      distance_km transport temps_trajet_en_heures
#>    <chr>       <chr>           <dbl> <fct>                      <dbl>
#>  1 ID-OYCL-010 travail          8.77 bus                         0.89
#>  2 ID-OYCL-010 commerces        6.92 mobylette                   0.91
#>  3 ID-OYCL-010 loisirs        395.   train                       0.79
#>  4 ID-MXOJ-007 travail         13.8  voiture                     0.16
#>  5 ID-MXOJ-007 commerces       31.7  voiture                     0.39
#>  6 ID-MXOJ-007 loisirs        242.   train                       0.48
#>  7 ID-OFNB-003 travail          2.01 velo                        0.36
#>  8 ID-OFNB-003 commerces       12.5  voiture                     0.15
#>  9 ID-OFNB-003 loisirs        376.   train                       0.75
#> 10 ID-RMIX-009 travail          7.90 mobylette                   0.95
#> # … with 20 more rows
```

### fake transport use

``` r
answers <- fake_sondage_answers(n = 30)
answers
#> # A tibble: 90 x 12
#>    id_individu   age sexe  region id_departement nom_departement
#>    <chr>       <int> <chr> <chr>  <chr>          <chr>          
#>  1 ID-XGRW-015    21 O     Rhône… 38             Isère          
#>  2 ID-XGRW-015    21 O     Rhône… 38             Isère          
#>  3 ID-XGRW-015    21 O     Rhône… 38             Isère          
#>  4 ID-EUWP-022    NA O     Bourg… 21             Côte-d'Or      
#>  5 ID-EUWP-022    NA O     Bourg… 21             Côte-d'Or      
#>  6 ID-EUWP-022    NA O     Bourg… 21             Côte-d'Or      
#>  7 ID-RAFQ-029    69 <NA>  Franc… 90             Territoire de …
#>  8 ID-RAFQ-029    69 <NA>  Franc… 90             Territoire de …
#>  9 ID-RAFQ-029    69 <NA>  Franc… 90             Territoire de …
#> 10 ID-JIDO-016    93 <NA>  Nord-… 62             Pas-de-Calais  
#> # … with 80 more rows, and 6 more variables: question_date <dttm>,
#> #   year <dbl>, type <chr>, distance_km <dbl>, transport <fct>,
#> #   temps_trajet_en_heures <dbl>

ggplot(answers) + aes(age, log(distance_km), colour = type) + geom_point() +
  geom_smooth() + facet_wrap(~type, scales = "free_y")
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
#> Warning: Removed 3 rows containing non-finite values (stat_smooth).
#> Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

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
