# example A.3 of section A.2.1 
# (example A.3 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 
# Title: Demonstrating side effects 

> x<-1
> good <- function() { x <- 5}
> good()
> print(x)
[1] 1
> bad <- function() { x <<- 5}
> bad()
> print(x)
[1] 5

