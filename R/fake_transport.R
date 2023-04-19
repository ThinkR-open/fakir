#' Base transport
#'
#' @param n number of clients
#' @param seed random seed
#' @param local the local of the base. Currently supported : "fr_FR" and "en_US".
#'
#' @importFrom tibble tibble as_tibble
#' @importFrom dplyr mutate select everything group_by ungroup sample_n left_join arrange
#' @importFrom charlatan ch_name ch_credit_card_provider ch_job
#' @importFrom stats runif rnorm rlnorm rbeta
#' @importFrom withr with_seed
#' @importFrom purrr as_vector
#'
#' @details
#' \itemize{
#'   \item id_individu Unique identification of people with "ID-AAAA-1111" pattern
#'   \item sexe. sex. c("F" = "Female", "M" = "Male", "O" = "Other"). Some are missing
#'   \item age age. Some are missing
#'   \item region. some regions have NA values that may be fill with left_join with fra_sf dataset. Some regions are more represented than others
#'   \item id_departement. number identifying French department
#'   \item nom_departement. Name of the department. Some departement have NA values that may be fill using id_departement.
#'   \item question_date. Date/hour when questionnaire has been answered.
#'   \item year. year extracted from question_date
#' }
#' @return A dataframe of fake result from a .
#' @examples
#' fake_survey_people(10)
#' @export
#' @rdname fake_survey
fake_survey_people <- function(n, seed = 2811, local = c("fr_FR")) {
  local <- match.arg(local)
  # Sample region/dpt with frequency according to region
  # Comment: Best random number is when vector is size of data
  # Hence, runif on unique(.$region)
  reg_dpt <- fakir::fra_sf %>%
    select(region, departement, id_dpt) %>%
    as_tibble() %>%
    left_join(
      tibble(
        region = unique(.$region),
        freq = runif(length(unique(.$region)), 0, 100)
      ),
      by = "region"
    ) %>%
    sample_n(n, weight = freq, replace = TRUE) %>%
    select(-freq) %>%
    mutate(
      region = with_random_na(region),
      departement = with_random_na(departement)
    )

  withr::with_seed(
    seed = seed,
    suppressWarnings(
      tibble(
        id_individu = paste0(
          "ID-",
          as_vector(rerun(n, sample(LETTERS, 4)) %>%
            map(paste0, collapse = "")),
          "-",
          formatC(1:n, width = nchar(n) + 1, flag = "0")
        ),
        # job = with_random_na(ch_job(n = n, locale = "fr_FR")),
        sexe = with_random_na(sample(c("F", "M", "O"), n, replace = TRUE)),
        age = with_random_na(sample(18:95, n, replace = TRUE)),
        region = reg_dpt$region,
        id_departement = reg_dpt$id_dpt,
        nom_departement = reg_dpt$departement,
        question_date = Sys.time() - abs(rnorm(n, 0, sd = 2) * 365 * 24 * 3600),
        year = year(question_date)
      ) %>%
        arrange(question_date) %>%
        select(id_individu, age, sexe, region, id_departement, nom_departement, everything())
    )
  )
}

#' @rdname fake_survey
#' @keywords internal
#' @export
fake_sondage_people <- function(...){
  warning("fake_sondage_people() is deprecated. \nUse fake_survey_people() instead.")
  fake_survey_people(...)
}


#' Create fake transport sondage
#'
#' @param n Number of sondage
#' @param x Optionnal. fake client data base with "age" column
#' @param seed fixe la graine aleatoire
#' @param split Logical. Split database in individuals and answers
#' @param local the local of the base. Currently supported : "fr_FR" and "en_US".
#'
#' @importFrom withr with_seed
#' @importFrom dplyr mutate n tibble rename
#' @importFrom stats rlnorm
#' @importFrom tidyr unnest
#'
#' @details
#' \itemize{
#'   \item 3 types for each individuals: travail, commerces, loisirs
#'   \item distance_km. Average distance (km) to target location. Distance is related to age.
#'   \item transport. Mean of transport to go to target location. Depends on distance.
#'   \item time_travel_hours. Average duration (hours) to target location. Depends on distance and transport.
#' }
#'
#' @examples
#' answers <- fake_sondage_answers()
#' if (FALSE){
#' ggplot(answers) +
#'   aes(age, log(distance_km), colour = type) +
#'   geom_point() +
#'   geom_smooth() +
#'   facet_wrap(~type, scales = "free_y")
#' }
#'
#' @export
#' @rdname fake_survey
fake_survey_answers <- function(
  n = 200,
  x,
  seed = 2811,
  split = FALSE,
  local = c("fr_FR")
) {
  local <- match.arg(local)
  types <- c("travail" = 5, "commerces" = 20, "loisirs" = 150)

  # transports and max dists
  transports <- c(
    "pied" = 2,
    "velo" = 5,
    "mobylette" = 8,
    "bus" = 10,
    "voiture" = 80,
    "train" = 500,
    "avion" = 2000,
    "navette_spatiale" = 10000
  )

  if (missing(x)) {
    x <- fake_survey_people(n = n, seed = seed, local = local)
  }

  with_seed(
    seed = seed,
    res <- suppressWarnings(
      x %>%
        mutate(answers = list(
          tibble(
            type = names(types)
          )
        )) %>%
        unnest(answers) %>%
        mutate(
          distance_km = rlnorm(nrow(.), log(types[type] * (1 + (100 - ifelse(is.na(age), 0, age)) / 100)), 0.6),
          transport = cut(distance_km, breaks = c(0, transports), labels = names(transports), include.lowest = TRUE),
          time_travel_hours = round(distance_km / rlnorm(nrow(.), log(transports[transport]), 0.05), digits = 2)
        )
    )
  )

  if (local == "fr_FR") {
    res <- res %>%
      rename(temps_trajet_en_heures = time_travel_hours)
  }

  if (!split) {
    return(res)
  } else if (local == "fr_FR") {
    list(
      individus = x,
      answers = res %>% select(id_individu, type, distance_km, transport, temps_trajet_en_heures)
    )
  } else {
    list(
      individuals = x,
      answers = res %>% select(id_individu, type, distance_km, transport, time_travel_hours)
    )
  }
}

#' @rdname fake_survey
#' @keywords internal
#' @export
fake_sondage_answers <- function(...){
  warning("fake_survey_answers() is deprecated. \nUse fake_survey_answers() instead.")
  fake_survey_answers(...)
}
