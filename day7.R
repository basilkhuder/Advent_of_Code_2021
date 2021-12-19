# Part One ----------------------------------------------------------------
# Advent of Code using only base-R
# My first nested for-loop in R in over two years 

input <- readLines("input7.txt") |>
  strsplit(",") |>
  {
    \(x) Reduce("c", x)
  }() |>
  as.numeric()

result_vec <- c()
for (i in seq_along(input)) {
  result <- c()
  for (j in seq_along(input)) {
    result[[j]] <- abs(input[[i]] - input[[j]])
    
  }
  result_vec[[i]] <- result
  
}

scoring_df <- lapply(result_vec, \(x) Reduce("c", x))
scoring_df <-
  lapply(scoring_df, \(x) as.data.frame(x) |> 
         t() |> 
         as.data.frame())

Reduce("rbind", scoring_df) |>
  {
    \(x) setNames(x, input)
  }() |>
  colSums() |>
  min()


