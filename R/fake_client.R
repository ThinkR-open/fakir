#' Create a fake base of tickets
#'
#' A fake base of customer support tickets
#'
#' @param n the number of clients
#' @param local the local of the base. Currently supported : "fr_FR" and "en_US".
#' @param seed the random seed, default is 2811
#'
#' @importFrom withr with_seed
#' @importFrom charlatan ch_name ch_credit_card_provider ch_job
#' @importFrom attempt stop_if_not
#' @importFrom dplyr mutate select rename as_tibble left_join tibble sample_n tibble
#' @importFrom stats runif rnorm rlnorm rbeta
#'
#' @examples
#' fake_base_clients(n = 10)
#' fake_base_clients(n = 10, local = "fr_FR")
#'
#' @return A dataframe of fake clients.
#' @export

fake_base_clients <- function(
  n,
  local = c("en_US", "fr_FR"),
  seed = 2811
) {
  stop_if_not(n, is.numeric, "Please provide a numeric value for `n`")
  priority_levels <- c("Bronze", "Silver", "Gold", "Platinium")
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

  with_seed(
    seed = seed,
    {
      res <- suppressWarnings(
        tibble(
          name = ch_name(n = n, locale = local),
          job = with_random_na(ch_job(n = n, locale = local)),
          # age = sample(18:75, n, replace = TRUE),
          region = reg_dpt$region,
          id_dpt = reg_dpt$id_dpt,
          departement = reg_dpt$departement,
          entry_date = Sys.time() - abs(rnorm(n, 0, sd = 2) * 365 * 24 * 3600),
          cb_provider = with_random_na(ch_credit_card_provider(n = n))
        ) %>%
          # separate(col = name, into = c("first", "last"), sep = " ", extra = "merge", fill = "right") %>%
          mutate(
            first = gsub("([^ ]*).*", "\\1", name),
            last = gsub("[^ ]* ([^ ]*)", "\\1", name)
          ) %>%
          arrange(entry_date) %>%
          # Client info
          mutate(
            num_client = as.character(1:n),
            fidelity_points = round(
              # rlnorm(n, log(as.numeric(Sys.Date() - as.Date(entry_date))), sdlog = 0.5)
              abs(rnorm(
                n,
                as.numeric(Sys.Date() - as.Date(entry_date)),
                sd = 0.5 * max(as.numeric(Sys.Date() - as.Date(.$entry_date)))
              ))
            )
          ) %>%
          mutate(
            # Age depending on point_fidelite with beta noise
            age = round(18 + (85 - 18) * rbeta(
              n,
              (5 * fidelity_points / max(.$fidelity_points)) /
                (1 - fidelity_points / max(.$fidelity_points)),
              5
            )) %>% with_random_na(),
            # priorite depending on fidelite
            priority_encoded = pmax(
              pmin(
                as.numeric(cut(.$fidelity_points, breaks = 4)) +
                  round(rnorm(n, 0, 0.5)),
                4
              ),
              1
            ),
            priority = factor(
              priority_levels[priority_encoded],
              levels = priority_levels
            )
          ) %>%
          select(
            num_client,
            first,
            last,
            job,
            age,
            region,
            id_dpt,
            departement,
            cb_provider,
            everything()
          )
      )
    }
  )

  if (local == "fr_FR") {
    res <- res %>%
      rename(
        prenom = first,
        nom = last,
        nom_complet = name,
        gestionnaire_cb = cb_provider,
        priorite = priority,
        priorite_encodee = priority_encoded,
        points_fidelite = fidelity_points
      )
  }
  structure(res, class = c("tbl_df", "tbl", "data.frame"))
}


#' Base ticket client
#'
#' Une fausse base client de ticket Telecom
#'
#' @param vol le nombre de tickets a retourner
#' @param x Optionnal. fake client data base
#' @param n Number of clients in the client database if x not provided
#' @param split la base doit elle être separee en deux ?
#' @param seed fixe la graine aleatoire
#' @param local the local of the base. Currently supported : "fr_FR" and "en_US".
#'
#' @importFrom glue glue
#' @importFrom withr with_seed
#' @importFrom tibble tibble
#' @importFrom dplyr select recode arrange everything sample_n
#' @importFrom purrr map rerun as_vector
#' @importFrom magrittr %>%
#' @importFrom lubridate year month day
#' @importFrom stats runif rnorm rlnorm
#'
#' @details
#' \itemize{
#'   \item Same client can have multiple tickets
#'   \item Some clients are more sampled than others
#'   \item Some types are more sampled than others
#'   \item Some etat are more sampled than others
#' }
#'
#' @examples
#' x <- fake_ticket_client(1000, split = TRUE)
#' plot(x$clients$entry_date, x$clients$fidelity_points)
#' barplot(table(x$tickets$type))
#' barplot(table(x$tickets$state))
#'
#' @export
#' @return A dataframe of fake tickets.
fake_ticket_client <- function(
  vol,
  x,
  n = 200,
  split = FALSE,
  seed = 2811,
  local = c("en_US", "fr_FR")
) {
  local <- match.arg(local)


  if (missing(x)) {
    x <- fake_base_clients(n = n, seed = seed, local = local)
  }

  withr::with_seed(
    seed = seed,
    res <- suppressWarnings(
      # client
      x %>%
        sample_n(vol, weight = runif(nrow(.), 0.5, 1), replace = TRUE) %>%
        # Ticket info
        mutate(
          ref = random_doss(vol),
          timestamp = as.Date(entry_date) + round(runif(nrow(.), 0, Sys.Date() - as.Date(entry_date))),
          year = year(timestamp),
          month = month(timestamp),
          day = day(timestamp),
          supported = sample_yes(vol, local = local),
          supported_encoded = recode_sample_yes(supported, local = local),
          type = with_random_na(sample_type(vol, local = local)),
          type_encoded = recode_sample_types(type, local = local),
          state = sample_state_level(vol, local = local),
          source_call = sample_source_call(vol, local = local)
        ) %>%
        arrange(year, month, day) %>%
        select(ref, everything())
    )
  )

  if (local == "fr_FR") {
    res <- res %>%
      rename(
        pris_en_charge = supported,
        pris_en_charge_code = supported_encoded,
        etat = state,
        source_appel = source_call,
        annee = year,
        mois = month,
        jour = day
      )
  }

  if (!split) {
    return(res)
  } else if (local == "fr_FR") {
    list(
      clients = x,
      tickets = res %>% select(
        ref,
        num_client,
        annee,
        mois,
        jour,
        timestamp,
        pris_en_charge,
        type,
        etat,
        source_appel
      )
    )
  } else {
    list(
      clients = x,
      tickets = res %>% select(
        ref,
        num_client,
        year,
        month,
        day,
        timestamp,
        supported,
        type,
        state,
        source_call
      )
    )
  }
}
