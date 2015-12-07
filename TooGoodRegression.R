##############################################################
##### CODE FOR PRODUCING A 'TOO GOOD' LINEAR REGRESSION ######
##############################################################

##### R script for simulating and producing a linear regression with exceptionally good fitting to the data

##### This code has been used to exemplify the need to be cautious when interpreting exceptionally good outputs from statistical models:
##### http://pablogarcia-diaz.blogspot.com.au/2015/12/a-few-tips-for-modelling-and-analysing_6.html

##### Read the readme file for this repository before running any analyses

###### Simulate some independent data from a Normal distribution

x<-rnorm(100,  mean=-0.5, sd=3.16)

###### Simulate the response variable by using a linear regression relating y to the simulated data (x); intercept: 0.15; slope: 0.76;
###### and include a very small Normally distributed error term. 

y<-(0.15+0.76*x) + rnorm(100, mean=0.001, sd=0.1)

###### Fit a linear regression

lin.mod<-lm(y~x)

###### Summarise the results of the fitted linear regression

summary(lin.mod)
