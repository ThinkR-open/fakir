# Create a fake base of tickets

A fake base of customer support tickets

## Usage

``` r
fake_base_clients(n, local = c("en_US", "fr_FR"), seed = 2811)
```

## Arguments

- n:

  the number of clients

- local:

  the local of the base. Currently supported : "fr_FR" and "en_US".

- seed:

  the random seed, default is 2811

## Value

A dataframe of fake clients.

## Examples

``` r
fake_base_clients(n = 10)
#> # A tibble: 10 × 14
#>    num_client first    last    job     age region id_dpt departement cb_provider
#>  * <chr>      <chr>    <chr>   <chr> <dbl> <chr>  <chr>  <chr>       <chr>      
#>  1 1          Laney    Adams   Inve…    85 Rhône… 26     Drôme       JCB 16 dig…
#>  2 2          Dr.      TalanZ… Auto…    18 NA     93     Seine-Sain… Voyager    
#>  3 3          Carlisle Cassin  Ward…    83 Lorra… 55     Meuse       Voyager    
#>  4 4          Jadiel   FeestI… Engi…    42 Bourg… 21     NA          JCB 16 dig…
#>  5 5          Ophelia  Winthe… Purc…    30 Poito… 86     Vienne      Diners Clu…
#>  6 6          Sierra   Hettin… Tran…    NA Lorra… 54     Meurthe-et… JCB 16 dig…
#>  7 7          Sydnee   Nitzsc… NA       50 Aquit… 33     Gironde     American E…
#>  8 8          Cade     Turcot… Prod…    43 Bourg… 58     Nièvre      NA         
#>  9 9          Leeroy   BeattyV Food…    40 NA     64     Pyrénées-A… Discover   
#> 10 10         Ammon    Dickens Acco…    36 Poito… 17     Charente-M… VISA 16 di…
#> # ℹ 5 more variables: name <chr>, entry_date <dttm>, fidelity_points <dbl>,
#> #   priority_encoded <dbl>, priority <fct>
fake_base_clients(n = 10, local = "fr_FR")
#> # A tibble: 10 × 14
#>    num_client prenom nom   job     age region id_dpt departement gestionnaire_cb
#>  * <chr>      <chr>  <chr> <chr> <dbl> <chr>  <chr>  <chr>       <chr>          
#>  1 1          Marine L'Ma… Tech…    85 Midi-… 09     NA          Diners Club / …
#>  2 2          Roland Pasc… Cons…    82 Bourg… 89     Yonne       NA             
#>  3 3          Danie… L'Si… Offi…    82 Pays … 72     NA          VISA 16 digit  
#>  4 4          Mathi… Ruiz… Acou…    33 Île-d… 77     Seine-et-M… American Expre…
#>  5 5          Élise  Nava… Tech…    81 Midi-… 12     Aveyron     Diners Club / …
#>  6 6          Alice  Cout… Cons…    69 Rhône… 26     Drôme       JCB 16 digit   
#>  7 7          Noémi… Alla… Méde…    NA Pays … 72     Sarthe      JCB 15 digit   
#>  8 8          Benoît Guyon NA       46 Prove… 83     Var         JCB 15 digit   
#>  9 9          Adèle  Pare… Bota…    44 NA     31     Haute-Garo… JCB 16 digit   
#> 10 10         Phili… Bért… Arch…    18 Alsace 68     Haut-Rhin   VISA 16 digit  
#> # ℹ 5 more variables: nom_complet <chr>, entry_date <dttm>,
#> #   points_fidelite <dbl>, priorite_encodee <dbl>, priorite <fct>
```
