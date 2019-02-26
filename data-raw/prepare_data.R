# Map of France
fra_sf <- raster::getData('GADM', country = 'FRA', level = 2, path = "data-raw") %>%
  sf::st_as_sf(fra.sp) %>%
  rename(
    pays = NAME_0,
    region = NAME_1,
    departement = NAME_2,
    id_dpt = CCA_2) %>%
  mutate(n_dpt = formatC(id_dpt, width = 2, flag = "0")) %>%
  select(OBJECTID, pays, region, departement, id_dpt)

usethis::use_data(fra_sf, overwrite = TRUE)

# test age en fonction de points fidelite
test_age <- function(x, n = length(x)) round(18 + (85 - 18)*rbeta(
  n,
  # (2 * log(x+1)/max(log(x+1)))/(1 - log(x+1)/max(log(x+1))),
  # (2 * (x^2)/max(x^2))/(1 - (x^2)/max((x^2))),
  # (3 * (x)/max(x))/(1 - (x)/max((x))),
  (5 * (x)/max(x))/(1 - (x)/max((x))),
  5))

x <- seq(0, 5000, by = 10)
plot(x, test_age(x))
hist(test_age(x))

# Test entry_date fidelity
fidel <- function(x, n = length(x)) round(
  abs(
    rnorm(n,
          as.numeric(Sys.Date() - as.Date(x)),
          sd = 0.3*max(as.numeric(Sys.Date() - as.Date(x))))
  )
)
  # rlnorm(n,
  #        log(as.numeric(Sys.Date() - as.Date(x))),
  #        # sdlog = 0.5
  #        sdlog = 6/log(as.numeric(Sys.Date() - as.Date(x))*100)
  #        ))

x_year <- rep(2010:2017, each = 10)
x <- paste0(x_year, "-01-01")
boxplot(fidel(x) ~ x_year)

