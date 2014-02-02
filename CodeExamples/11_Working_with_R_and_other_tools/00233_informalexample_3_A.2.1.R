# informalexample:3_A.2.1 
# informalexample:3 : Working with R and other tools : Starting with R : Primary Features of R 

> x<-1
> good <- function() { x <- 5}
> good()
> print(x)
[1] 1
> bad <- function() { x <<- 5}
> bad()
> print(x)
[1] 5

