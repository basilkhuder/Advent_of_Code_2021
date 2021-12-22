# Part One ----------------------------------------------------------------
# Advent of Code using only base-R

input <- readLines("input9.txt")
ncol <- length(strsplit(input[[1]], "")[[1]])

input <- input |>
  strsplit("") |>
  {
    \(x) Reduce("c", x)
  }() |>
  as.numeric()

input_mat <- matrix(
  nrow = length(input) / ncol,
  ncol = ncol,
  data = input,
  byrow = TRUE
)


check_surrondings <- \(input_mat, row, col) {
  dir <- list(
    left = try(input_mat[row, col + 1], silent = TRUE)
    ,
    right = try(input_mat[row, col - 1], silent = TRUE)
    ,
    down = try(input_mat[row + 1, col], silent = TRUE)
    ,
    up = try(input_mat[row - 1, col], silent = TRUE)
  )
  
  dir <- lapply(dir, \(x) ifelse(class(x) == "try-error", 100, x))
  dir <- sapply(dir, \(x) ifelse(is.na(x), 100, x))
  
  if (all(dir > input_mat[row, col]))
  {
    return_num <- 1 + input_mat[row, col]
  } else {
    return_num <- 0
  }
  return_num
  
}

dim <- dim(input_mat)

counter <- 0
for (i in seq(dim[[1]])) {
  for (j in seq(dim[[2]])) {
    counter <<- check_surrondings(input_mat, i, j) + counter
    
  }
  
  
}

counter

