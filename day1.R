input <- readLines("input.txt") |>
  as.numeric() 

depth_compare <- sapply(seq(2, length(input)), \(x) input[[x]] - input[[x - 1]]) 
                        
depth_compare[depth_compare > 0] |>
  length()

