# informalexample:7_A.2.1 
# informalexample:7 : Working with R and other tools : Starting with R : Primary features of R 
> vec <- c(1,2)
> fun <- function(v) { v[[2]]<-5; print(v)}
> fun(vec)
[1] 1 5
> print(vec)
[1] 1 2
