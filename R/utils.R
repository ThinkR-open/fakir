with_random_na <- function(vec) {
  vec[sample(1:length(vec), round(length(vec) / sample(2:20, 1)))] <- NA
  vec
}

sample_doss <- function(vol) {
  res <- replicate(vol, sample(LETTERS, 4), simplify = FALSE)
  res <- lapply(res, paste, collapse = "")
  paste0("DOSS-", res)
}

sample_yes <- function(vol, local = "en_US") {
  if (local == "en_US") vec <- c("Yes", "No")
  if (local == "fr_FR") vec <- c("Oui", "Non")
  sample(vec, vol, TRUE)
}

recode_sample_yes <- function(vec, local = "en_US") {
  if (local == "en_US") {
    return(recode(vec, Yes = 1L, No = 0L))
  }
  if (local == "fr_FR") {
    return(recode(vec, Oui = 1L, Non = 0L))
  }
}

sample_type <- function(vol, local = "en_US") {
  if (local == "en_US") {
    vec <- c("Settings", "Box", "Phone")
  }
  if (local == "fr_FR") {
    vec <- c("Installation", "Box", "Ligne")
  }
  sample(
    vec,
    vol,
    prob = runif(3, 0.25, 1),
    replace = TRUE
  )
}

recode_sample_types <- function(vec, local = "en_US") {
  if (local == "en_US") {
    return(recode(vec, Settings = 1L, Box = 2L, Phone = 3L))
  }
  if (local == "fr_FR") {
    return(recode(vec, Installation = 1L, Box = 2L, Ligne = 3L))
  }
}

sample_state_level <- function(vol, local = "en_US") {
  if (local == "en_US") {
    state_level <- c(
      "Running",
      "Over",
      "technician",
      "Waiting for internal validation",
      "Waiting for client feedback",
      "Done"
    )
  }
  if (local == "fr_FR") {
    state_level <- c(
      "En cours",
      "Attente confirmation client",
      "Attente validation",
      "Intervention technicien",
      "Termine"
    )
  }
  factor(
    sample(
      state_level,
      vol,
      prob = runif(length(state_level), 0.25, 1),
      replace = TRUE
    ),
    levels = state_level
  )
}

sample_source_call <- function(vol, local = "en_US") {
  source_level <- c(
    "Local",
    "France",
    "Europe",
    "International"
  )
  factor(
    sample(source_level, vol, replace = TRUE),
    source_level
  )
}

sample_type <- function(vol, local = "en_US") {
  if (local == "en_US") vec <- c("Settings", "Box", "Phone")
  if (local == "fr_FR") vec <- c("Installation", "Box", "Ligne")
  sample(vec, vol, TRUE)
}

sample_state <- function(vol, local = "en_US") {
  if (local == "en_US") vec <- c("Running", "Over", "technician", "Waiting for internal validation", "Waiting for client feedback")
  if (local == "fr_FR") vec <- c("En cours", "Cloture", "Intervention technicien", "Attente validation", "Attente confirmation client")
  sample(vec, vol, TRUE)
}
sample_priority <- function(vol, local = "en_US") {
  if (local == "en_US") vec <- c("Gold", "Silver", "Bronze", "Platinium")
  if (local == "fr_FR") vec <- c("Gold", "Silver", "Bronze", "Platinium")
  sample(vec, vol, TRUE)
}
sample_source <- function(vol, local = "en_US") {
  if (local == "en_US") vec <- c("Local", "US", "Europe", "International")
  if (local == "fr_FR") vec <- c("Local", "France", "Europe", "International")
  sample(vec, vol, TRUE)
}

recode_it <- function(vec) {
  codes <- 1:length(unique(vec))
  names(codes) <- unique(vec)
  unname(codes[vec])
}
