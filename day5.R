# Part One --------------------------------------------------------------------------
# Advent of Code using base-R

input <- readLines("input5.txt") |>
  {\(x) gsub(" -> ", ",", x)}() |>
  strsplit(",") |>
  lapply(\(x) data.frame(x1 = x[[1]],
                   y1 = x[[2]],
                   x2 = x[[3]],
                   y2 = x[[4]])) 


input_df <- input[sapply(input, \(x) x$x1 == x$x2 | x$y1 == x$y2)] |>
  {\(x) Reduce("rbind", x)}()


x_y_coord <- list(Map(seq, input_df$x1, input_df$x2),
              Map(seq, input_df$y1, input_df$y2))

x_y_coord <- Map(cbind, x_y_coord[[1]], x_y_coord[[2]]) |>
                  {\(x) do.call(rbind, x)}() 

x_y_coord[duplicated(x_y_coord), ] |>
  unique() |>
  nrow()
                

# Part Two --------------------------------------------------------------------------

input_df <- Reduce("rbind", input)

x_y_coord <- list(Map(seq, input_df$x1, input_df$x2),
                  Map(seq, input_df$y1, input_df$y2))

x_y_coord <- Map(cbind, x_y_coord[[1]], x_y_coord[[2]]) |>
  {\(x) do.call(rbind, x)}() 

x_y_coord[duplicated(x_y_coord), ] |>
  unique() |>
  nrow()
