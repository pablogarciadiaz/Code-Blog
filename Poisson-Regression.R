########################################################################################
##### CODE FOR ANALYSING THE INFLUENCE OF VEGETATION COVER ON  HUNTSMAN ABUNDANCE ######
########################################################################################

##### R script for simulating and producing Poisson-log GLM for modelling the abundance of hunstman spiders as a function of vegetation cover

##### This code has been used to provide an example on how to model abundance data:
##### http://pablogarcia-diaz.blogspot.com.au/2016/03/simple-models-for-abundance-ecologyis.html

##### Read the readme file for this repository before running any analyses


###### SIMULATE THE DATA

#### sample.size: number of plots surveyed for huntsman, n = 30

set.seed(1000)

sample.size<-30

#### Simulate vegetation cover data for the survey plots from a Beta distribution

veg.cov<-rbeta(sample.size, 0.5, 0.5)

#### Define the parameters of the Poisson-log GLM for the relationship between the huntsman abundance and the vegetation cover

intercept.sim=-2 	#### Intercept
slope.sim=3		#### Slope

#### Define the mean huntsman abundance ? as a function of the vegetation cover

lambda<-exp(intercept.sim+slope.sim*veg.cov)

#### Finally, obtain the huntsman abundance in each and every survey plot by drawing values from a Poisson distribution with mean ?

abundance<-rpois(sample.size, lambda)

##### Plot the simulated relationship between the huntsman abundance and the vegetation cover

plot(abundance~veg.cov, xlab="Vegetation cover (%)", ylab="Huntsman abundance", pch=19, cex=3)



###### MODEL ABUNDANCE

#### Fit a Poisson-log GLM to the huntsman abundance (dependent variable) and vegetation cover data (independent), and have a look at the summary table

fit1<-glm(abundance~veg.cov, family=poisson())

summary(fit1)

#### Calculate the 95% Confidence Intervals

conf.int<-confint(fit1)

conf.int
