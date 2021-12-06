# Part One --------------------------------------------------------------------------
# Advent of Code using only base-R
# Solving through iteration

input <- readLines("input.txt") |>
  as.numeric()

depth_compare <-
  sapply(seq(2, length(input)), \(x) input[[x]] - input[[x - 1]])

depth_compare[depth_compare > 0] |>
  length()

# Solving Using the diff() function to calculate lagging differences

input[diff(input, lag = 1) > 0] |>
  length() - 1


# Part Two ----------------------------------------------------------------
# Sum of three measurement window

sum(diff(input, lag = 3) > 0)

