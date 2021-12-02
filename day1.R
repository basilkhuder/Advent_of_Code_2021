# Part One --------------------------------------------------------------------------

input <- readLines("input.txt") |>
  as.numeric()

depth_compare <-
  sapply(seq(2, length(input)), \(x) input[[x]] - input[[x - 1]])

depth_compare[depth_compare > 0] |>
  length()

# Using the diff() function to calculate lagging differences

input[diff(input, lag = 1) > 0] |>
  length() - 1
