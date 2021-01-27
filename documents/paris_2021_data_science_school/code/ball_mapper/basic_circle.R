library("BallMapper")

#This is a toy example of the use of Ball Mapper. We will start by constructing
#a collection of points sampled from a unit circle

var <- seq(from=0,to=6.3,by=0.1)
x <- sin(var)
y <- cos(var)
points <- as.data.frame( cbind( x,y ) )

#We can make a scatter plot of the obtained circle:
plot(x,y)

#We will use the x variable as a colouring function of the BM graph.
values <- as.data.frame( x )

#And now we construct a Ball Mapper plot of the point cloud. Please manipulate
#the radius to check various options.
epsilon <- 0.25
l <- BallMapper(points,values,epsilon)
ColorIgraphPlot(l)