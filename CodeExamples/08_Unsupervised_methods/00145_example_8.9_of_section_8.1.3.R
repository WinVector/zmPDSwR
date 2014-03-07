# example 8.9 of section 8.1.3 
# (example 8.9 of section 8.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: Evaluating clusterings with different numbers of clusters 

library(reshape2)                                         	# Note: 1 
clustcrit <- ch_criterion(pmatrix, 10, method="hclust")     	# Note: 2 
critframe <- data.frame(k=1:10, ch=scale(clustcrit$crit),   	# Note: 3 
                       wss=scale(clustcrit$wss))
critframe <- melt(critframe, id.vars=c("k"),                	# Note: 4 
                 variable.name="measure",
                 value.name="score")
ggplot(critframe, aes(x=k, y=score, color=measure)) +     	# Note: 5 
  geom_point(aes(shape=measure)) + geom_line(aes(linetype=measure)) +
  scale_x_continuous(breaks=1:10, labels=1:10)

# Note 1: 
#   Load the reshape2 package (for the melt() 
#   function). 

# Note 2: 
#   Calculate both criteria for 1–10 
#   clusters. 

# Note 3: 
#   Create a data frame with the number of 
#   clusters, the CH criterion, and the WSS criterion. 
#   We’ll scale both the CH and WSS criteria to 
#   similar ranges so that we can plot them both on 
#   the same graph. 

# Note 4: 
#   Use the melt() function to put the data 
#   frame in a shape suitable for ggplot 

# Note 5: 
#   Plot it. 

