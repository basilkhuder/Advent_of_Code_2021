# Part One --------------------------------------------------------------------------
# Advent of Code using only base-R

# Part One --------------------------------------------------------------------------

input <- readLines("input4.txt")
bingo_nums <- input[[1]] |>
  strsplit(",")

bingo_nums <- bingo_nums[[1]] |>
  as.numeric()

boards <- input[-1]
boards <- split(boards, cumsum(boards == ""))

boards <- lapply(boards, \(x) {
  boards <- x[x != ""]
  boards <- paste0(boards, collapse = " ")
  boards <- strsplit(boards, " ")[[1]]
  boards <- boards[boards != ""]
  boards <- as.numeric(boards)
  matrix(boards,
         nrow = 5,
         ncol = 5,
         byrow = TRUE) |>
    as.data.frame()
  
})

row_check <- \(x) {
  col_sums <- colSums(x)
  row_sums <- rowSums(x)
  ifelse(col_sums == 5 | row_sums == 5, "Yes", "No")
  
}

bingo_call <- \(boards) {
  x <- lapply(seq_along(bingo_nums), \(x) boards == bingo_nums[[x]])
  x <- Reduce("+", x, accumulate = TRUE)
  x <- lapply(x, row_check)
  bingo_win <-
    lapply(seq_along(x), \(y) data.frame(bingo = as.character(x[[y]]), index = y))
  subset(do.call(rbind, bingo_win), bingo == "Yes")$index |>
    min()
  
}

bingo_call_index <- sapply(boards, bingo_call)
winning_board <-
  boards[as.numeric(names(which(
    bingo_call_index == min(bingo_call_index)
  )))]

wb_scoring <- lapply(bingo_nums, \(x) winning_board[[1]] == x)
wb_scoring <- Reduce("+", wb_scoring, accumulate = TRUE)
wb_scoring_check <- lapply(wb_scoring, row_check)
wb_scoring_check  <- lapply(seq_along(wb_scoring_check), \(x) {
  data.frame(bingo = as.character(wb_scoring_check[[x]]) , index = x)
})

wb_scoring_check <- do.call(rbind, wb_scoring_check)
wb_scoring_index <-
  min(subset(wb_scoring_check, bingo == "Yes")$index)
wb_scoring_board <- wb_scoring[wb_scoring_index][[1]]
winning_board[[1]][ifelse(wb_scoring_board == 1, FALSE, TRUE)] |>
  sum() * bingo_nums[wb_scoring_index]


