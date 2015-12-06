#######################################################################
##### EXPLORATORY ANALYSES FOR THE LIZARD SNOUT-VENT LENGTH DATA  #####
#######################################################################

##### R script for running the exploratory analyses to check the assumption of normality in the distribution of SVL measures 

##### The analyses are explained in this blog post: http://pablogarcia-diaz.blogspot.com.au/2015/12/a-few-tips-for-modelling-and-analysing.html

##### Read the readme file for this repository before running any analyses

##### Original data on lizard SVL measures available from here: http://www.gardinitiative.org/data.html


##### Load the data


lizard.svl<-read.table("f:/Blog/lizard_species_weight_and_svl_data.csv", header=T, sep=",")


##### Produce a summary statistics table for all the variables contained in the dataset


summary(lizard.svl)


##### Calculate the mean and standard deviation of the SVL measures


mean.svl<-mean(lizard.svl$SVL)


sd.svl<-sd(lizard.svl$SVL)


##### Estimate the density of the SVL measures


dens.obs<-density(lizard.svl$SVL)



###### Now, let's simulate the expected distribution of SVL values under a Normal distribution - the expected distribution of SVL measures if they follow a Normal distribution


sim.svl<-rnorm(length(lizard.svl$SVL), mean.svl, sd.svl)


##### Estimate the density of expected SVL values


dens.sim<-density(sim.svl)


##### Plots

par(mfrow=c(2, 1))


##### Histogram of the observed distribution of SVL measures


hist(lizard.svl$SVL)


##### Line plot of the density of observed SVL measures


plot(dens.obs, lwd=2)


##### Add the density of expected SVL measures to the graph and draw the line in red for comparison


lines(dens.sim, col="red", lwd=2)



##### Repeat the process, but now for the log-transformed SVL measures


mean.svl<-mean(log(lizard.svl$SVL))

sd.svl<-sd(log(lizard.svl$SVL))

dens.obs<-density(log(lizard.svl$SVL))

sim.svl<-rnorm(length(lizard.svl$SVL), mean.svl, sd.svl)

dens.sim<-density(sim.svl)


####### Plots for the log-transformed data

par(mfrow=c(2, 1))

hist(log(lizard.svl$SVL))

plot(dens.obs, lwd=2)

lines(dens.sim, col="red", lwd=2)

