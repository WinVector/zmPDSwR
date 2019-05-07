# example 5.14 of section 5.2.5 
# (example 5.14 of section 5.2.5)  : Choosing and evaluating models : Evaluating models : Evaluating clustering models 
# Title: Calculating the typical distance between items in every pair of clusters 

library('reshape2')

n <- nrow(d)

pairs <- merge(1:n, 1:n, all=TRUE)
names(pairs) <- c("a",  "b")
pairs$ca <- d[pairs$a, 'cluster'][[1]]
pairs$cb <- d[pairs$b, 'cluster'][[1]]
pairs$dist <- sqrt((d[pairs$a, 'x']-d[pairs$b, 'x'])^2 + (d[pairs$a, 'y']-d[pairs$b, 'y'])^2)[[1]]

dcast(pairs, ca~cb, value.var='dist', mean)

##   ca         1         2         3         4         5
## 1  1 0.1478480 0.6524103 0.3780785 0.4404508 0.7544134
## 2  2 0.6524103 0.2794181 0.5551967 0.4990632 0.5165320
## 3  3 0.3780785 0.5551967 0.2031272 0.6122986 0.4656730
## 4  4 0.4404508 0.4990632 0.6122986 0.2048268 0.8365336
## 5  5 0.7544134 0.5165320 0.4656730 0.8365336 0.2221314

