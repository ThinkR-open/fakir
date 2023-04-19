#' Create a fake support ticket base
#'
#' @inheritParams fake_ticket_client
#' @param from,to the date to cover
#'
#' @importFrom withr with_seed
#' @importFrom attempt attempt stop_if_any stop_if
#' @importFrom lubridate ymd day month year
#'
#' @export
#'
#' @return A dataframe of fake web visits.
#'
#' @examples
#' fake_visits()
fake_visits <- function(
  from = "2017-01-01",
  to = "2017-12-31",
  local = c("en_US", "fr_FR"),
  seed = 2811
    ) {
  from <- attempt(ymd(from), "Please provide a YMD date format", silent = TRUE)
  to <- attempt(ymd(to), "Please provide a YMD date format", silent = TRUE)

  stop_if_any(
    list(from, to),
    ~ inherits(.x, "try-error"),
    "Please provide a date format"
  )

  stop_if(from > to, msg = "`from` should be before `to`")

  local <- match.arg(local)

  dates <- seq(from, to, by = 1)
  vol <- length(dates)
  with_seed(
    seed = seed,
    {
      res <- data.frame(
        timestamp = dates
      )
      res$year <- year(res$timestamp)
      res$month <- month(res$timestamp)
      res$day <- day(res$timestamp)
      res$home <- with_random_na(sample(100:500, vol, replace = TRUE))
      res$about <- with_random_na(sample(50:300, vol, replace = TRUE))
      res$blog <- with_random_na(sample(300:700, vol, replace = TRUE))
      res$contact <- with_random_na(sample(50:500, vol, replace = TRUE))
    }
  )
  if (local == "fr_FR") {
    res <- data.frame(
      dates = res$timestamp,
      an = res$year,
      mois = res$month,
      jour = res$day,
      accueil = res$home,
      a_propos = res$about,
      blog = res$blog,
      contact = res$contact
    )
  }
  structure(res, class = c("tbl_df", "tbl", "data.frame"))
}
