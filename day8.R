# Part One ----------------------------------------------------------------
# Advent of Code using only base-R

input <- readLines("input8.txt") |>
  strsplit(" \\| ") |>
  {
    \(x) lapply(x, \(x) x[[2]])
  }() |>
  {
    \(x) lapply(x, \(x) strsplit(x, " "))
  }() |>
  {
    \(x) Reduce("c", x)
  }() |>
  {
    \(x) Reduce("c", x)
  } ()

char_extract <- \(string) length(strsplit(string, "")[[1]])

char_lengths <- sapply(input, char_extract)
char_lengths[char_lengths %in% c(2, 4, 3, 7)] |>
  length()
