#' Base ticket client
#'
#' Une fausse base client de ticket télécom
#'
#' @param vol le nombre de lignes à retourner
#' @param split la base doit elle être séparée en deux ?
#' @param seed fixe la graine aléatoire
#'
#' @importFrom glue glue
#' @importFrom withr with_seed
#' @importFrom tibble tibble
#' @importFrom dplyr select recode
#' @importFrom charlatan ch_name ch_credit_card_provider ch_job
#' @importFrom purrr map rerun as_vector
#' @importFrom magrittr %>%
#' @importFrom tidyr separate
#'
#' @export

fausse_base_ticket_client <- function(vol, split = FALSE, seed = 2811){
  withr::with_seed(seed = seed,
                   res <- suppressWarnings(
                     tibble(
                       num_client = as.character(1:vol),
                       name = ch_name(n = vol, locale = "fr_FR"),
                       job = with_random_na(ch_job(n = vol, locale = "fr_FR")),
                       age = sample(18:75, vol, replace = TRUE),
                       departement = with_random_na(sample(c(01:95, NA), vol, replace = TRUE)),
                       cb_provider = with_random_na(ch_credit_card_provider(n = vol)),
                       point_fidelite = sample(1:10000, vol, replace = TRUE),
                       an = sample(2010:2015, vol, replace = TRUE),
                       mois = sample(1:12, vol, replace = TRUE),
                       jour = sample(1:15, vol, replace = TRUE),
                       timestamp = paste(an, mois, jour, sep = "-"),
                       prise_en_charge = sample(c("Oui","Non"), vol, TRUE),
                       prise_en_charge_encoded = recode(prise_en_charge, Oui = 1L, Non = 0L),
                       ref = paste0("DOSS-", as_vector(rerun(vol, sample(LETTERS, 4)) %>% map(paste0, collapse = ""))),
                       type = with_random_na(sample(c("Installation","Box","Ligne"), vol, replace = TRUE)),
                       type_encoded = recode(type, Installation = 1L, Box = 2L, Ligne = 3L),
                       etat = sample(c("En cours","Terminé","Intervention technicien", "Attente validation", "Attente confirmation client"), vol, replace = TRUE),
                       priorite = sample(c("Gold","Silver","Bronze", "Platinium"), vol, replace = TRUE),
                       priorite_encoded = recode(priorite, Bronze = 1L, Silver = 2L, Gold = 3L, Platinium = 4L),
                       source_appel = sample(c("Local","France","Europe", "International"), vol, replace = TRUE)
                     ) %>% separate(col = name, into = c("Prénom", "Nom"), sep = " ")
                   )
  )
  if (!split) return(res)
  list(base = select(res, num_client, Prénom, Nom, job, age, departement, cb_provider),
       tickets = select(res, num_client, an, mois, jour, timestamp, prise_en_charge, ref, type, etat, priorite, source_appel))
}



