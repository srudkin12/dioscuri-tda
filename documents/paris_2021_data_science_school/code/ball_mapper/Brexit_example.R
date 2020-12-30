#Dataset taken from https://www.pippanorris.com/data
#Experiment proposed by Simon Rudkin, https://www.swansea.ac.uk/staff/som/academic-staff/s.t.rudkin/

library("BallMapper")
#We are importing the Pippa Norris dataset:
dt1<-read.table("brexitdata",sep="\t",header=TRUE)


#In this whole example we use the simplified socio-economical data gathering information about housing, relationship, number of cars, profession, self assessed health as well as the level of deprivation of the area the constituancy is located
db104<-as.data.frame(cbind(dt1$c11HouseOutright,dt1$c11HouseMortgage,dt1$c11HouseholdOnePerson,dt1$c11HouseholdMarried,dt1$c11CarsNone,dt1$c11CarsOne,dt1$c11CarsTwo,dt1$c11NSSECLowerManager,dt1$c11QualNone,dt1$c11QualLevel4,dt1$c11HealthVeryGood,dt1$c11HealthGood,dt1$c11DeprivedNone,dt1$c11Deprived1))

#As the computations with the current code will take a while, I will do them initially and subsequently will just visuakise the results
brexit <- BallMapper(db104,as.data.frame(dt1$leaveHanretty),18)
labour <- BallMapper(db104,as.data.frame(dt1$lm17),18)
tories <- BallMapper(db104,as.data.frame(dt1$cm17),18)


#In this case we color the graph by support for Brexit in 2016 referendum.
ColorIgraphPlot(brexit,seed_for_plotting=1)

%In this case we color the graph by support for Labour party in 2017 election.
ColorIgraphPlot(labour,seed_for_plotting=1)

%In this case we color the graph by support for Conservative party in 2017 election.
ColorIgraphPlot(tories,seed_for_plotting=1)

#We may want to see why there is a node 20 so different from others supporting Tories:
one <- c(20)
two <- c(6,7,10)
one_p <- points_covered_by_landmarks(tories,one)
two_p <- points_covered_by_landmarks(tories,two)
find_dominant_difference_using_averages(db104,one_p,two_p)


#We see that the coordinates 9, 10 and 13 makes much difference. To find out what
#They are, we should look at the list of variables:
#1 - dt1$c11HouseOutright,
#2 - dt1$c11HouseMortgage,
#3 - dt1$c11HouseholdOnePerson,
#4 - dt1$c11HouseholdMarried,
#5 - dt1$c11CarsNone,
#6 - dt1$c11CarsOne,
#7 - dt1$c11CarsTwo,
#8 - dt1$c11NSSECLowerManager,
#9 - dt1$c11QualNone,
#10 - dt1$c11QualLevel4,
#11 - dt1$c11HealthVeryGood,
#12 - dt1$c11HealthGood,
#13 - dt1$c11DeprivedNone,
#14 - dt1$c11Deprived1
#Therefore we have no (9) or lowest (10) level of qualification and deprivation
#of the area. One can bring this analysis forward, and find the regions responsible
#for that, but we will not do it here.