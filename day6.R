#Part One ----------------------------------------------------------------
#VERY inefficient, and don't like having to use superassignment.

input <- readLines("input6.txt") |>
  strsplit(",") |>
  {
    \(x) as.numeric(Reduce("c", x))
  }()

check_day <- \(x) {
  if (x != 0) {
    x - 1
  } else {
    c(8, 6)
  }
}

for (i in seq(80)) {
  input <<- lapply(input, check_day)
  input <<- do.call(c, input)
  
}

input |>
  length()
