# Part One --------------------------------------------------------------------------

input <- readLines("input2.txt") |>
  strsplit(" ") 

coordinates <- lapply(input, \(x) {
  data.frame(Direction = x[[1]], Position = as.numeric(x[[2]]))
})

coordinates <- do.call(rbind, coordinates)
coord_sum <- aggregate(coordinates$Position, 
                       by = list(Group = coordinates$Direction), 
                       FUN = sum) 

(coord_sum[1, ]$x - coord_sum[3, ]$x) * coord_sum[2, ]$x

# Part Two --------------------------------------------------------------------------

