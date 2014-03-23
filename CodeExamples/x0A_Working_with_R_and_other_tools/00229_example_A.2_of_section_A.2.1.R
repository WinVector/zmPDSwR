# example A.2 of section A.2.1 
# (example A.2 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 
# Title: Binding values to function arguments 

> divide <- function(numerator,denominator) { numerator/denominator }
> divide(1,2)
[1] 0.5
> divide(2,1)
[1] 2
> divide(denominator=2,numerator=1)
[1] 0.5
divide(denominator<-2,numerator<-1)  # yields 2, a wrong answer
[1] 2

