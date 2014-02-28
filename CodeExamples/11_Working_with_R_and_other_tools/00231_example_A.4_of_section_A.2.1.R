# example A.4 of section A.2.1 
# (example A.4 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 
# Title: R truth tables for Boolean operators 

> c(T,T,F,F) == c(T,F,T,F)
[1]  TRUE FALSE FALSE  TRUE
> c(T,T,F,F) & c(T,F,T,F)
[1]  TRUE FALSE FALSE FALSE
> c(T,T,F,F) | c(T,F,T,F)
[1]  TRUE  TRUE  TRUE FALSE

