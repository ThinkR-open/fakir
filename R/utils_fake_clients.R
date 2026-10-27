random_doss <- function(vol) {
  paste0(
    "DOSS-",
    as_vector(
      map(seq_len(vol), function(i) sample(LETTERS, 4)) %>%
        map(paste0, collapse = "")
    ),
    "-",
    formatC(1:vol, width = nchar(vol) + 1, flag = "0")
  )
}
