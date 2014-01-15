# informalexample:2_A.2.2 
# informalexample:2 : Installing tools and working with R : Starting with R : Primary R data types 

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

> x[['a',drop=F]]
$a
[1] 6

> x[c('a','a','b','b'),drop=F]
$a
[1] 6

$a
[1] 6

$b
[1] "fred"

$b
[1] "fred"

