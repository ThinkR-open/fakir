random_doss <- function(vol) {
  paste0(
    "DOSS-",
    as_vector(
      rerun(vol, sample(LETTERS, 4)) %>%
        map(paste0, collapse = "")
    ),
    "-",
    formatC(1:vol, width = nchar(vol) + 1, flag = "0")
  )
}
