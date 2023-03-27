test_that("fake_products works", {
  for (i in sample(1:100, 15)) {
    prod <- fake_products(i)
    expect_equal(nrow(prod), i)
    expect_equal(ncol(prod), 8)
    expect_is(prod, "data.frame")
  }
})

test_that("fake_feedback works", {
  for (i in sample(1:100, 15)) {
    feed <- fake_user_feedback(i)
    expect_equal(nrow(feed), i)
    expect_equal(ncol(feed), 3)
    expect_is(feed, "data.frame")
  }
})
