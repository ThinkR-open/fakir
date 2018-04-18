#' Create a fake base of tickets
#'
#' A fake base of customer support tickets
#'
#' @param vol the number of observations to return
#' @param local the local of the base. Currently supported : "fr_FR" and "en_US".
#' @param seed the random seed, default is 2811
#'
#' @importFrom glue glue
#' @importFrom withr with_seed
#' @importFrom dplyr select rename tibble
#' @importFrom charlatan ch_name ch_credit_card_provider ch_job
#' @importFrom tidyr separate
#' @importFrom attempt stop_if_not
#'
#' @export

fake_support_tickets <- function(vol, local = c("fr_FR", "en_US"), seed = 2811){
  stop_if_note(vol, is.numeric, "Please provide a numeric value for `vol`")
  local <- match.arg(local)
  with_seed(seed = seed,
            res <- suppressWarnings(
              tibble(
                num = as.character(1:vol),
                name = ch_name(n = vol, locale = local),
                job = with_random_na(ch_job(n = vol, locale = local)),
                age = sample(18:75, vol, replace = TRUE),
                dep = with_random_na(sample(c(01:95, NA), vol, replace = TRUE)),
                cb_provider = with_random_na(ch_credit_card_provider(n = vol)),
                points = sample(1:10000, vol, replace = TRUE),
                year = sample(2010:2015, vol, replace = TRUE),
                month = sample(1:12, vol, replace = TRUE),
                day = sample(1:28, vol, replace = TRUE),
                timestamp = paste(year, month, day, sep = "-"),
                supported = sample_yes(vol, local),
                supported_encoded = recode_it(supported),
                ref = sample_doss(vol),
                type = with_random_na(sample_type(vol, local)),
                type_encoded = recode_it(type),
                state = sample_state(vol, local),
                priority = sample_priority(vol, local),
                priority_encoded = recode_it(priority),
                source = sample_source(vol, local)
              ) %>% separate(col = name, into = c("first", "last"), sep = " ")
            )
  )
  if (local == "fr_FR"){
    res %>%
      rename(num_client = num,
             prenom = first,
             nom = last,
             departement = dep,
             points_fidelite = points,
             an = year,
             mois = month,
             jour  = day,
             prise_en_charge = supported,
             prise_en_charge_encoded = supported_encoded,
             etat = state,
             priorite = priority,
             priorite_encoded = priority_encoded,
             source_appel = source)
  } else if (local == "en_US") {
    res
  }
}
# fake_support_tickets(10, "fr_FR")

#' Title
#'
#' @inheritParams fake_support_tickets
#'
#' @inheritParams fake_support_tickets
#' @param from,to the date to cover
#'
#' @importFrom withr with_seed
#' @importFrom attempt attempt stop_if_any
#' @importFrom dplyr tibble rename
#' @export
#'
#' @examples

fake_visits <- function(from = "2017-01-01", to = "2017-12-31",
                                 local = c("fr_FR", "en_US"), seed = 2811){

  from <- attempt(ymd(from), "Please provide a date format")
  to <- attempt(ymd(to), "Please provide a date format")
  stop_if_any(list(from, to), ~ inherits(.x, "try-error"), "Please provide a date format")

  local <- match.arg(local)

  dates <- seq(from, to, by = 1)
  vol <- length(dates)
  with_seed(seed = seed,
            res <- tibble(
                timestamp = dates,
                year = year(timestamp),
                month = month(timestamp),
                day = day(timestamp),
                home = sample(100:500, vol, replace = TRUE),
                about = sample(50:300, vol, replace = TRUE),
                blog = sample(300:700, vol, replace = TRUE),
                contact = sample(50:500, vol, replace = TRUE)
              )
  )
  if (local == "fr_FR"){
    res %>%
      rename(dates = timestamp,
             an = year,
             mois = month,
             jour = day,
             accueil = home,
             a_propos = about)
  } else if (local == "en_US") {
    res
  }
}
