points <- read.table(file = "boston",header=FALSE, sep="\t")
values <- read.table(file = "boston_prices",header=FALSE, sep="\n")
epsilon <- 100
l <- BallMapper::BallMapper(points,values,epsilon)
ColorIgraphPlot(l)
colorByAllVariables(l,points)

small = c(10,11,12,13)
large = 1:9
small_pts = points_covered_by_landmarks(l,small)
large_pts = points_covered_by_landmarks(l,large)
find_dominant_difference_using_averages(points,small_pts,large_pts)
