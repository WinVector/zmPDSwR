# informalexample:4_A.2.1 
# informalexample:4 : Working with R and other tools : Starting with R : Primary features of R 
> c(T,T,F,F) == c(T,F,T,F)
[1]  TRUE FALSE FALSE  TRUE
> c(T,T,F,F) & c(T,F,T,F)
[1]  TRUE FALSE FALSE FALSE
> c(T,T,F,F) | c(T,F,T,F)
[1]  TRUE  TRUE  TRUE FALSE
