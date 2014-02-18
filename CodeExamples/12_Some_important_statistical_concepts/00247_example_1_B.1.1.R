# example:1_B.1.1 
# example:1 : Some important statistical concepts : A few important distributions : The normal distribution 
# Title: 
                    Plotting the theoretical normal density 


                    Plotting the theoretical normal density
                    library(ggplot2)

x <- seq(from=-5, to=5, length.out=100) # the interval [-5 5]
f <- dnorm(x)                           # normal with mean 0 and sd 1
ggplot(data.frame(x=x,y=f), aes(x=x,y=y)) + geom_line()

