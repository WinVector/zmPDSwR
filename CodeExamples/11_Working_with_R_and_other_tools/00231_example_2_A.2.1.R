# example:2_A.2.1 
# example:2 : Working with R and other tools : Starting with R : Primary features of R 
# Title: 
                                        Demonstrating side effects 


                                        Demonstrating side effects
                                        > x<-1
> good <- function() { x <- 5}
> good()
> print(x)
[1] 1
> bad <- function() { x <<- 5}
> bad()
> print(x)
[1] 5

