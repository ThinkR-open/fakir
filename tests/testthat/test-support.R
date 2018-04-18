context("test-support.R")

test_that("fake support ticket generation works", {
  us <- fake_support_tickets(10, "en_US")
  expect_equal(nrow(us), 10)
  expect_equal(ncol(us), 21)
  expect_equal(names(us), c("num", "first", "last", "job", "age", "dep", "cb_provider",
                            "points", "year", "month", "day", "timestamp", "supported",
                            "supported_encoded", "ref", "type", "type_encoded", "state",
                            "priority", "priority_encoded", "source"))

  fr <- fake_support_tickets(10, "fr_FR")
  expect_equal(nrow(fr), 10)
  expect_equal(ncol(fr), 21)
  expect_equal(names(fr), c("num_client", "prenom", "nom", "job", "age", "departement",
                            "cb_provider", "points_fidelite", "an", "mois", "jour",
                            "timestamp", "prise_en_charge", "prise_en_charge_encoded",
                            "ref", "type", "type_encoded", "etat", "priorite",
                            "priorite_encoded", "source_appel"))

  expect_error(fake_support_tickets(10, "sp_SP"))
})

test_that("fake website generation works", {
  us <- fake_visits()
  expect_equal(nrow(us), 365)
  expect_equal(ncol(us), 8)
  expect_equal(names(us), c("timestamp", "year", "month", "day", "home", "about", "blog", "contact"))

  fr <- fake_visits(local = "fr_FR")
  expect_equal(nrow(fr), 365)
  expect_equal(ncol(fr), 8)
  expect_equal(names(fr), c("dates", "an", "mois", "jour", "accueil", "a_propos", "blog", "contact"))

  expect_error(fake_visits(10, "en_US"))
  expect_error(fake_visits("2017-01-01", "1027"))
  expect_error(fake_visits("2017", "1027-01-01"))
  expect_error(fake_visits(local = "sp_SP"))
  expect_error(fake_visits("2017-01-01", "2016-01-01"))
})
