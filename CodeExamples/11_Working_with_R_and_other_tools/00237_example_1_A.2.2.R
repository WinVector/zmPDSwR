# example:1_A.2.2 
# example:1 : Working with R and other tools : Starting with R : Primary R data types 
# Title: 
                                        Examples of R indexing operators 


                                        Examples of R indexing operators
                                        > x <- list('a'=6,b='fred')
> names(x)
[1] "a" "b"
> x$a
[1] 6
> x$b
[1] "fred"
> x[['a']]
$a
[1] 6

> x[c('a','a','b','b')]
$a
[1] 6

$a
[1] 6

$b
[1] "fred"

$b
[1] "fred"

