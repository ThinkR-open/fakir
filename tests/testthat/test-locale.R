test_that("fake_ticket_client(local = 'en_US') has no French tokens in source_call (#9)", {
  df <- fakir::fake_ticket_client(vol = 200, local = "en_US", seed = 42)
  # The source_call column in en_US mode should not include "France"
  # (that is the French-locale label).
  expect_false("France" %in% levels(df$source_call))
  expect_false("France" %in% as.character(df$source_call))
})

test_that("fake_ticket_client(local = 'fr_FR') keeps French tokens", {
  df <- fakir::fake_ticket_client(vol = 200, local = "fr_FR", seed = 42)
  expect_true("France" %in% as.character(df$source_appel) ||
                "Europe" %in% as.character(df$source_appel))
})

test_that("sample_source_call is locale-aware", {
  skip_if_not(exists("sample_source_call", envir = asNamespace("fakir")))
  withr::with_seed(
    seed = 1,
    {
      en <- fakir:::sample_source_call(200, local = "en_US")
      fr <- fakir:::sample_source_call(200, local = "fr_FR")
    }
  )
  expect_false("France" %in% levels(en))
  expect_true("France" %in% levels(fr) || "France" %in% as.character(fr))
})
