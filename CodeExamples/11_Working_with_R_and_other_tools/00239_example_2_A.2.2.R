# example:2_A.2.2 
# example:2 : Working with R and other tools : Starting with R : Primary R data types 
# Title: R's treatment of unexpected factor levels 

> factor('red',levels=c('red','orange'))
[1] red
Levels: red orange
> factor('apple',levels=c('red','orange'))
[1] <NA>
Levels: red orange

