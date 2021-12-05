# Part One ----------------------------------------------------------------
# Binary numbers for power consumption

input <- readLines("input3.txt") |>
  strsplit("") 

input_df <- do.call(rbind, input) |>
  as.data.frame()

gamma <- sapply(seq_along(input_df), \(x) { 
  col <- table(input_df[,x])
  col <- names(which(col == max(col)))
  })

epislon <- sapply(seq_along(input_df), \(x) { 
  col <- table(input_df[,x])
  col <- names(which(col == min(col)))
})

power <- lapply(list(gamma, epislon), \(x) paste0(x, collapse = "") |>
                  strtoi(base = 2))

Reduce("*", power)
