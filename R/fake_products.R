fake_symbol <- function() {
  toupper(
    paste0(
      ifelse(runif(1) < 0.5, charlatan::ch_element_symbol(1), ""),
      ifelse(runif(1) < 0.5, charlatan::ch_element_symbol(1), "")
    )
  )
}

fake_name <- function() {
  paste0(
    ifelse(runif(1) < 0.05, "Smart ", ""),
    sample(
      c(
        "Activity Tracker",
        "Watch",
        "Sleep/Heart Rate Monitor",
        "Activity Monitor",
        "Digital Video Wear",
        "Wearable",
        "Multi-Sport Cardio",
        "Running Tracker",
        "Swimming Tracker",
        "Biking Tracker",
        "Fitness Tracker",
        "Pedometer",
        "Step and Distance Pedometer",
        "Microcontroller",
        "Action Video Camera",
        "Multifunction Tracker",
        "Footpod",
        "Wearable Transmitter",
        "Exercise Tracker",
        "Training System",
        "Loop Activity Tracker",
        "Action Camera",
        "Strapless Heart Rate Monitor",
        "Health ring"
      ),
      1
    ),
    " ",
    fake_symbol(),
    " ",
    ifelse(runif(1) < 0.5, "Pro ", ""),
    ifelse(
      runif(1) < 0.5,
      sprintf(
        "with %s",
        sample(
          c(
            "Bluetooth",
            "GPS",
            "WiFi",
            "heart rate sensor",
            "Calorie Counter",
            "MP3 Player",
            "Automatic Lap Counter",
            "Health Management Software",
            "Wearable Magneat",
            "Wi-Fi and GPS",
            "Activity/Sleep Tracking"
          )
        )
      ),
      ""
    )
  ) %>%
    gsub("^[ \t]*", "", .) %>%
    gsub("[ \t]+$", "", .) %>%
    gsub(" {2,}", " ", .)
}

#' Fake base of products
#'
#' @param n Number of Products to generate
#' @inheritParams fake_base_clients
#'
#' @return a dataframe
#' @export
#' @importFrom withr with_seed
#' @importFrom charlatan ch_company ch_color_name
#' @importFrom tibble tibble
#'
#' @return A dataframe of fake products.
#'
#' @examples
#' fake_products(10)
fake_products <- function(n, seed = 2811) {
  with_seed(
    seed = seed,
    {
      res <- tibble::tibble(
        name = vapply(1:n, function(x) fake_name(), character(1)),
        brand = sample(ch_company(13), n, TRUE),
        color = ch_color_name(n),
        price = sample(1:n, n, TRUE),
        body_location = sample(
          c("Wrist", "Arms", "Head", "Waist", "Chest", "Hands", "Neck", "Feet", "Torso", "Brain"),
          n,
          TRUE
        ),
        category = sample(
          c("Fitness", "Medical", "Lifestyle", "Entertainment", "Industrial", "Pets and Animals", "Gaming", "Awesome"),
          n,
          TRUE
        ),
        sent_from = sample(
          c("United States", "Japan", "Taiwan", "Canada", "Finland", "South Korea", "Netherlands", "France", "China", "Italy", "Austria"),
          n,
          TRUE
        ),
        id = 1:n
      )
    }
  )
  return(res)
}

#' Fake user feedbacks
#'
#' @param n Number of feedbacks to generate
#' @inheritParams fake_base_clients
#' @inheritParams fake_visits
#'
#' @return a dataframe
#' @export
#' @importFrom withr with_seed
#' @importFrom charlatan ch_name
#' @examples
#' fake_user_feedback(10)
fake_user_feedback <- function(n, seed = 2811, from = "2012-01-01 00:00:01", to = "2020-01-01 00:00:01") {
  with_seed(
    seed = seed,
    {
      data.frame(
        stringsAsFactors = FALSE,
        user = charlatan::ch_name(n),
        star = sample(1:5, n, TRUE),
        date = sample(
          seq.POSIXt(
            as.POSIXct(from),
            as.POSIXct(to),
            by = 1
          ),
          n,
          TRUE
        )
      )
    }
  )
}
