# example B.1 of section B.1.1 
# (example B.1 of section B.1.1)  : Important statistical concepts : Distributions : Normal distribution 
# Title: Plotting the theoretical normal density 

library(ggplot2)

x <- seq(from=-5, to=5, length.out=100) # the interval [-5 5]
f <- dnorm(x)                           # normal with mean 0 and sd 1
ggplot(data.frame(x=x,y=f), aes(x=x,y=y)) + geom_line()

