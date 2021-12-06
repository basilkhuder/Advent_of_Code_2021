# Part One --------------------------------------------------------------------------
# Advent of Code using only base-R
# Calculate positioning based upon input. Options include a horizontal positioning
# (affected by Up/Down) and a depth positioning (affected by Forward.)

input <- readLines("input2.txt") |>
  strsplit(" ")

coordinates <- lapply(input, \(x) {
  data.frame(Direction = x[[1]], Position = as.numeric(x[[2]]))
})

coordinates <- do.call(rbind, coordinates)
coord_sum <- aggregate(coordinates$Position,
                       by = list(Group = coordinates$Direction),
                       FUN = sum)

(coord_sum[1,]$x - coord_sum[3,]$x) * coord_sum[2,]$x

# Part Two --------------------------------------------------------------------------
# Part Two adds an aim component where down/up either increase or decreases it respectively.

coordinates <- within(coordinates, {
  Position <- ifelse(Direction == "up", Position * -1, Position)
  Aim <- cumsum(ifelse(Direction != "forward", Position, 0))
  Horizontal <- cumsum(ifelse(Direction == "forward", Position, 0))
  Depth <- cumsum(ifelse(Direction == "forward", Aim * Position, 0))
})

coordinates$Horizontal[nrow(coordinates)] * coordinates$Depth[nrow(coordinates)]
