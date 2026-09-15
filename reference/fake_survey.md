# Base transport

Base transport

Create fake transport sondage

## Usage

``` r
fake_survey_people(n, seed = 2811, local = c("fr_FR"))

fake_sondage_people(...)

fake_survey_answers(n = 200, x, seed = 2811, split = FALSE, local = c("fr_FR"))

fake_sondage_answers(...)
```

## Arguments

- n:

  Number of sondage

- seed:

  fixe la graine aleatoire

- local:

  the local of the base. Currently supported : "fr_FR" and "en_US".

- x:

  Optionnal. fake client data base with "age" column

- split:

  Logical. Split database in individuals and answers

## Value

A dataframe of fake result from a .

## Details

- id_individu Unique identification of people with "ID-AAAA-1111"
  pattern

- sexe. sex. c("F" = "Female", "M" = "Male", "O" = "Other"). Some are
  missing

- age age. Some are missing

- region. some regions have NA values that may be fill with left_join
  with fra_sf dataset. Some regions are more represented than others

- id_departement. number identifying French department

- nom_departement. Name of the department. Some departement have NA
  values that may be fill using id_departement.

- question_date. Date/hour when questionnaire has been answered.

- year. year extracted from question_date

&nbsp;

- 3 types for each individuals: travail, commerces, loisirs

- distance_km. Average distance (km) to target location. Distance is
  related to age.

- transport. Mean of transport to go to target location. Depends on
  distance.

- time_travel_hours. Average duration (hours) to target location.
  Depends on distance and transport.

## Examples

``` r
fake_survey_people(10)
#> # A tibble: 10 × 8
#>    id_individu   age sexe  region           id_departement nom_departement
#>    <chr>       <int> <chr> <chr>            <chr>          <chr>          
#>  1 ID-NYDZ-010    NA NA    Rhône-Alpes      69             Rhône          
#>  2 ID-PWLB-009    71 F     Franche-Comté    70             Haute-Saône    
#>  3 ID-NMQG-001    42 M     Rhône-Alpes      07             NA             
#>  4 ID-RJXN-002    71 O     Rhône-Alpes      01             Ain            
#>  5 ID-MROK-007    41 M     Franche-Comté    25             Doubs          
#>  6 ID-VMKS-004    33 O     Alsace           68             Haut-Rhin      
#>  7 ID-XEMZ-003    81 O     Poitou-Charentes 79             Deux-Sèvres    
#>  8 ID-EUDQ-005    44 M     Poitou-Charentes 16             Charente       
#>  9 ID-DCIZ-008    92 O     Auvergne         63             Puy-de-Dôme    
#> 10 ID-KPUS-006    57 O     Auvergne         43             Haute-Loire    
#> # ℹ 2 more variables: question_date <dttm>, year <dbl>
answers <- fake_sondage_answers()
#> Warning: fake_survey_answers() is deprecated. 
#> Use fake_survey_answers() instead.
if (FALSE){
ggplot(answers) +
  aes(age, log(distance_km), colour = type) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~type, scales = "free_y")
}
```
