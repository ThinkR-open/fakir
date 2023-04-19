test_that("fake ticket client generation works", {
  us <- fake_ticket_client(10, local = "en_US", split = FALSE)
  expect_equal(nrow(us), 10)
  expect_equal(ncol(us), 25)
  expect_equal(
    names(us),
    c(
      "ref",
      "num_client",
      "first",
      "last",
      "job",
      "age",
      "region",
      "id_dpt",
      "departement",
      "cb_provider",
      "name",
      "entry_date",
      "fidelity_points",
      "priority_encoded",
      "priority",
      "timestamp",
      "year",
      "month",
      "day",
      "supported",
      "supported_encoded",
      "type",
      "type_encoded",
      "state",
      "source_call"
    )
  )

  fr <- fake_ticket_client(10, local = "fr_FR", split = FALSE)
  expect_equal(nrow(fr), 10)
  expect_equal(ncol(fr), 25)
  expect_equal(
    names(fr),
    c(
      "ref",
      "num_client",
      "prenom",
      "nom",
      "job",
      "age",
      "region",
      "id_dpt",
      "departement",
      "gestionnaire_cb",
      "nom_complet",
      "entry_date",
      "points_fidelite",
      "priorite_encodee",
      "priorite",
      "timestamp",
      "annee",
      "mois",
      "jour",
      "pris_en_charge",
      "pris_en_charge_code",
      "type",
      "type_encoded",
      "etat",
      "source_appel"
    )
  )

  expect_error(fake_ticket_client(10, local = "sp_SP"))
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

test_that("fake transport generation works", {
  fr <- fake_survey_answers(10)

  expect_equal(nrow(fr), 30)
  expect_equal(ncol(fr), 12)
  expect_equal(
    names(fr),
    c(
      "id_individu",
      "age",
      "sexe",
      "region",
      "id_departement",
      "nom_departement",
      "question_date",
      "year",
      "type",
      "distance_km",
      "transport",
      "temps_trajet_en_heures"
    )
  )
})

test_that("deprecated fun still works generation works", {
  expect_warning({
    fr <- fake_sondage_answers(10)
  })

  expect_equal(
    nrow(fr),
    nrow(fake_survey_answers(10))
  )
  expect_equal(
    ncol(fr),
    ncol(fake_survey_answers(10))
  )
  expect_equal(
    names(fr),
    names(fake_survey_answers(10))
  )

  expect_warning({
    fr <- fake_sondage_people(10)
  })

  expect_equal(
    nrow(fr),
    nrow(fake_survey_people(10))
  )
  expect_equal(
    ncol(fr),
    ncol(fake_survey_people(10))
  )
  expect_equal(
    names(fr),
    names(fake_survey_people(10))
  )
})
