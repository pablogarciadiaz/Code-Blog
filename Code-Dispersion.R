####################################################################################
##### CODE FOR ASSESSING DISPERSION IN COUNT MODELS USING A QAUSI-POISSON GLM ######
####################################################################################

##### R script for simulating and producing a quasi-Poisson GLM for assessing dispersion in a count model analysing the abundance of Cunningham's skinks as a function of vegetation cover

##### This code has been used to provide an example on how to evaluate the presence of dispersion in a statiscal count model:
##### http://pablogarcia-diaz.blogspot.com.au/2016/07/assessing-dispersion.html

##### Read the readme file for this repository before running any analyses


###### SIMULATE THE DATA

#### sample.size: number of plots surveyed for Cunningham's skinks, n = 30

set.seed(1000)

sample.size<-30


#### Simulate vegetation cover data for the survey plots from a Beta distribution


veg.cov<-rbeta(sample.size, 0.5, 0.5)


#### Now, let’s define the parameters of the Poisson-log GLM relationship between the Cunningham’s skinks abundance and the vegetation cover


intercept.sim=-2 	#### Intercept
slope.sim=5		#### Slope


#### Define the mean Cunningham’s skinks abundance lambda as a function of the vegetation cover


lambda<-exp(intercept.sim+slope.sim*veg.cov)


#### Now, we induce under-dispersion in the response variable by defining the dispersion parameter ? being less than 1


phi<-0.4


#### Finally, obtain the Cunningham’s skinks abundance in each and every plot by drawing values from a Poisson distribution with mean lambda and dispersion parameter phi


abundance<-rpois(sample.size, phi*lambda)


##### Let’s have a look at the relationship between th Cunningham's skink abundance and the vegetation cover


plot(abundance~veg.cov, xlab="Vegetation cover (%)", ylab="Skink abundance", pch=19, cex=3)


###### MODEL CUNNINGHAM'S SKINK ABUNDANCE


#### Fit a quasi-Poisson GLM to the Cunningham’s skink abundance (response variable) and vegetation cover data (independent covariate)


fit.ud<-glm(abundance~veg.cov, family=quasipoisson())


#### Have a look at the summary Table


summary(fit.ud)


#### Calculate the 95% Confidence Intervals

conf.int<-confint(fit.ud)

conf.int

