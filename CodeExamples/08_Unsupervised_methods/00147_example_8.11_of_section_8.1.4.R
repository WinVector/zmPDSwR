# example 8.11 of section 8.1.4 
# (example 8.11 of section 8.1.4)  : Unsupervised methods : Cluster analysis : The k-means algorithm 
# Title: Plotting cluster criteria 

> clustering.ch <- kmeansruns(pmatrix, krange=1:10, criterion="ch")   	# Note: 1 
> clustering.ch$bestk                                                	# Note: 2 
[1] 2
> clustering.asw <- kmeansruns(pmatrix, krange=1:10, criterion="asw") 	# Note: 3 
> clustering.asw$bestk
[1] 3

> clustering.ch$crit                                                 	# Note: 4 
 [1]  0.000000 14.094814 11.417985 10.418801 10.011797  9.964967
 [7]  9.861682  9.412089  9.166676  9.075569
> clustcrit$crit                                                     	# Note: 5 
 [1]       NaN 12.215107 10.359587  9.690891 10.011797  9.964967
 [7]  9.506978  9.092065  8.822406  8.695065

> critframe <- data.frame(k=1:10, ch=scale(clustering.ch$crit),        	# Note: 6 
             asw=scale(clustering.asw$crit))
> critframe <- melt(critframe, id.vars=c("k"),
                 variable.name="measure",
                  value.name="score")
> ggplot(critframe, aes(x=k, y=score, color=measure)) +
   geom_point(aes(shape=measure)) + geom_line(aes(linetype=measure)) +
   scale_x_continuous(breaks=1:10, labels=1:10)
> summary(clustering.ch)                                            	# Note: 7 
             Length Class  Mode
cluster      25     -none- numeric
centers      18     -none- numeric
totss         1     -none- numeric
withinss      2     -none- numeric
tot.withinss  1     -none- numeric
betweenss     1     -none- numeric
size          2     -none- numeric
crit         10     -none- numeric
bestk         1     -none- numeric

# Note 1: 
#   Run kmeansruns() from 1–10 clusters, and the 
#   CH criterion. By default, kmeansruns() uses 100 
#   random starts and 100 maximum iterations per 
#   run. 

# Note 2: 
#   The CH criterion picks two clusters. 

# Note 3: 
#   Run kmeansruns() from 1–10 clusters, and the 
#   average silhouette width criterion. Average 
#   silhouette width picks 3 clusters. 

# Note 4: 
#   The vector of criterion values is called 
#   crit. 

# Note 5: 
#   Compare the CH values for kmeans() and 
#   hclust(). They’re not quite the same, because the 
#   two algorithms didn’t pick the same 
#   clusters. 

# Note 6: 
#   Plot the values for the two criteria. 

# Note 7: 
#   kmeansruns() also returns the output of 
#   kmeans for k=bestk. 

