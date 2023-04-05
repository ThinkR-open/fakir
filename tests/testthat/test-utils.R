test_that("with_random_na works", {
  output <- with_random_na(letters)
  expect_true(
    length(
      output[is.na(output)]
    ) > 0
  )
})

test_that("sample_doss works", {
  output <- sample_doss(10)
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      grepl("DOSS-", output)
    )
  )
})

test_that("sample_doss works", {
  output <- sample_yes(10)
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      output %in% c("Yes", "No")
    )
  )
  output <- sample_yes(10, "fr_FR")
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      output %in% c("Oui", "Non")
    )
  )
})

test_that("sample_type works", {
  output <- sample_type(10)
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      output %in% c("Settings", "Box", "Phone")
    )
  )
  output <- sample_type(10, "fr_FR")
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      output %in% c("Installation", "Box", "Ligne")
    )
  )
})

test_that("sample_priority works", {
  output <- sample_priority(10)
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      output %in% c("Gold", "Silver", "Bronze", "Platinium")
    )
  )
  output <- sample_priority(10, "fr_FR")
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      output %in% c("Gold", "Silver", "Bronze", "Platinium")
    )
  )
})

test_that("sample_priority works", {
  output <- sample_priority(10)
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      output %in% c("Gold", "Silver", "Bronze", "Platinium")
    )
  )
  output <- sample_priority(10, "fr_FR")
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      output %in% c("Gold", "Silver", "Bronze", "Platinium")
    )
  )
})

test_that("sample_source works", {
  output <- sample_source(10)
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      output %in% c("Local", "US", "Europe", "International")
    )
  )
  output <- sample_source(10, "fr_FR")
  expect_true(
    length(
      output
    ) == 10
  )
  expect_true(
    all(
      output %in% c("Local", "France", "Europe", "International")
    )
  )
})

test_that("recode_it works", {
  output <- recode_it(letters)
  expect_true(
    length(
      output
    ) == length(letters)
  )
})
