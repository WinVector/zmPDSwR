# informalexample:1_B.1.1 
# informalexample:1 : Some Important Statistical Concepts : A few important distributions : The Normal Distribution 

library(ggplot2)

x = seq(from=-5, to=5, length.out=100) # the interval [-5 5]
f = dnorm(x)                           # normal with mean 0 and sd 1
ggplot(data.frame(x=x,y=f), aes(x=x,y=y)) + geom_line()

