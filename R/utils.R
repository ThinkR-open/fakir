with_random_na <- function(vec){
  vec[sample(1:length(vec), length(vec)/sample(10:20), 1)] <- NA
  vec
}
