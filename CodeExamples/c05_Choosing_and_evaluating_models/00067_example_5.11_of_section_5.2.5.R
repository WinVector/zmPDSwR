# example 5.11 of section 5.2.5 
# (example 5.11 of section 5.2.5)  : Choosing and evaluating models : Evaluating models : Evaluating clustering models 
# Title: Clustering random data in the plane 

set.seed(32297)
d <- data.frame(x=runif(100),y=runif(100))
clus <- kmeans(d,centers=5)
d$cluster <- clus$cluster

