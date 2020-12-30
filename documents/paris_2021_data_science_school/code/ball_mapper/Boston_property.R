rm(list=ls())
library("BallMapper")

#In this exercise we will play with a classical Boston Property Dataset.
#It describes the prices of properties in Boston in '70. The task is to understand
#how they depend on multiple factors. Please consider the following URL for more details
#https://www.cs.toronto.edu/~delve/data/boston/bostonDetail.html
#Note the list of considered variables. Varianble number 14:
#MEDV - Median value of owner-occupied homes in $1000's
#is the descriptive variable we want to understand.

#In order to avoid extensve file processing in R, two files boston and
#boston_prices have been prepared for you. In the code below we read them
#and create the Ball Mapper plot.

points <- read.table(file = "boston",header=FALSE, sep="\t")
values <- read.table(file = "boston_prices",header=FALSE, sep="\n")
epsilon <- 100
l <- BallMapper(points,values,epsilon)
ColorIgraphPlot(l)

#Please list the observations you can make abou the output. Please make sure
#that while running the code, the files are in your R current working directory.
#It can be checked by using getwd()


#Since our dataset is relativelly low dimensional, we may use each of 13 atriutes
#to see how it is distributed along the plot. The following command will
#create, in a working directory. Can you spot which variable seems to be most
#different among clusters?
colorByAllVariables(l,points)


#Let us try to validate the observation from the previous point. There is a function
#in the implementation of Ball Mapper that comapres averages of two distributions
#(given by variables in the predefined regions of the graph) and return the largest
#one.
small = c(10,11,12,13)
large = 1:9
small_pts = points_covered_by_landmarks(l,small)
large_pts = points_covered_by_landmarks(l,large)
find_dominant_difference_using_averages(points,small_pts,large_pts)
#This function somewhat confirms that the largest difference is obtained on the
#crime rate (variable 1), while the second largest on the index of accessibility
#to radial highway (communication indicator).