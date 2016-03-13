#################################################################################
##### CODE FOR ANALYSING THE INFLUENCE OF PREY ABUNDANCE ON  MINK PRESENCE ######
#################################################################################

##### R script for simulating and producing a logistic regression for modelling the presence of mink as a function of prey abundance

##### This code has been used to provide an example on how to model presence/absence data:
##### http://pablogarcia-diaz.blogspot.com/2016/03/simple-models-for-distributions.html

##### Read the readme file for this repository before running any analyses


###### SIMULATE THE DATA

#### sample.size: number of river sections surveyed for mink, n = 30

set.seed(1000)

sample.size<-30

#### Simulate prey abundance data for the river sections using a Poisson distribution, the mean abundance of prey per section would be 5. 

prey.ab<-rpois(sample.size, 5)

#### Now, let’s define the parameters of the logistic regression for the relationship between the mink presence and the prey abundance


intercept.sim=-5	#### Intercept
slope.sim=1.5		#### Slope

#### Define the probability of presence of mink as a function of prey abundance

prob.pres<-plogis(intercept.sim+slope.sim*prey.ab)

#### Finally, obtain the presence of mink in each river section by drawing values from a Bernoulli distribution with probability prob.pres. 
#### Remember that a Bernoulli distribution is a Binomial distribution with size =1

presence<-rbinom(sample.size, size=1, p=prob.pres)

##### Plot the simulated relationship between the mink presence and the prey abundance

plot(presence~prey.ab, xlab="Prey abundance", ylab="Mink presence", pch=19, cex=3)


###### MODEL PRESENCE
#### Fit a logistic regression to the mink presence (dependent variable) and prey abundance data (independent).

fit2<-glm(presence~prey.ab, family=binomial())

summary(fit2)

#### Calculate the 95% Confidence Intervals

conf.int<-confint(fit2)

conf.int
