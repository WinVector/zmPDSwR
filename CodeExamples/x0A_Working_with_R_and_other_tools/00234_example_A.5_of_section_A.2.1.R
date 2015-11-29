# example A.5 of section A.2.1 
# (example A.5 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 
# Title: Call-by-value effect 

> vec <- c(1,2)
> fun <- function(v) { v[[2]]<-5; print(v)}
> fun(vec)
[1] 1 5
> print(vec)
[1] 1 2

