# example B.2 of section B.1.1 
# (example B.2 of section B.1.1)  : Important statistical concepts : Distributions : Normal distribution 
# Title: Plotting an empirical normal density 

library(ggplot2)

# draw 1000 points from a normal with mean 0, sd 1
u <- rnorm(1000)

# plot the distribution of points,
# compared to normal curve as computed by dnorm() (dashed line)
ggplot(data.frame(x=u), aes(x=x)) + geom_density() +
   geom_line(data=data.frame(x=x,y=f), aes(x=x,y=y), linetype=2)

