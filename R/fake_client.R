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
#' @importFrom charlatan ch_name ch_credit_card_provider ch_job
#' @importFrom tidyr separate
#' @importFrom attempt stop_if_not
#'
#' @export

fake_support_tickets <- function(vol, local = c("en_US", "fr_FR"), seed = 2811){
  stop_if_not(vol, is.numeric, "Please provide a numeric value for `vol`")
  local <- match.arg(local)
  with_seed(
    seed = seed,
    {
      res <- suppressWarnings(
        data.frame(
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
          supported = sample_yes(vol, local),
          ref = sample_doss(vol),
          type = with_random_na(sample_type(vol, local)),
          state = sample_state(vol, local),
          priority = sample_priority(vol, local),
          source = sample_source(vol, local)
        )
      )

      res <- separate(res, col = name, into = c("first", "last"), sep = " ")
      res$timestamp = paste(res$year, res$month, res$day, sep = "-")
      res$supported_encoded = recode_it(res$supported)
      res$type_encoded = recode_it(res$type)
      res$priority_encoded = recode_it(res$priority)
      res <- res[, c(1:11, 18, 12, 19, 13:14, 20, 15:16, 21, 17)]
    }
  )
  if (local == "fr_FR"){
    res <- data.frame(
      num_client = res$num,
      prenom = res$first,
      nom = res$last,
      job = res$job,
      age = res$age,
      departement = res$dep,
      cb_provider = res$cb_provider,
      points_fidelite = res$points,
      an = res$year,
      mois = res$month,
      jour  = res$day,
      timestamp = res$timestamp,
      prise_en_charge = res$supported,
      prise_en_charge_encoded = res$supported_encoded,
      ref = res$ref,
      type = res$type,
      type_encoded = res$type_encoded,
      etat = res$state,
      priorite = res$priority,
      priorite_encoded = res$priority_encoded,
      source_appel = res$source
    )
  }
  structure(res, class = c("tbl_df", "tbl", "data.frame"))
}
# fake_support_tickets(10, "fr_FR")

