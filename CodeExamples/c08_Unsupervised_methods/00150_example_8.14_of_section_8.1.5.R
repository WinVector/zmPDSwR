# example 8.14 of section 8.1.5 
# (example 8.14 of section 8.1.5)  : Unsupervised methods : Cluster analysis : Assigning new points to clusters 
# Title: An example of assigning points to cluster 

rnorm.multidim <- function(n, mean, sd, colstr="x") {    	# Note: 1 
   ndim <- length(mean)
   data <- NULL
   for(i in 1:ndim) {
     col <- rnorm(n, mean=mean[[i]], sd=sd[[i]])
     data<-cbind(data, col)
   }
   cnames <- paste(colstr, 1:ndim, sep='')
   colnames(data) <- cnames
   data
 }

mean1 <- c(1, 1, 1)                    	# Note: 2 
sd1 <- c(1, 2, 1)

mean2 <- c(10, -3, 5)
sd2 <- c(2, 1, 2)

mean3 <- c(-5, -5, -5)
sd3 <- c(1.5, 2, 1)

clust1 <- rnorm.multidim(100, mean1, sd1)           	# Note: 3 
clust2 <- rnorm.multidim(100, mean2, sd2)
clust3 <- rnorm.multidim(100, mean3, sd3)
toydata <- rbind(clust3, rbind(clust1, clust2))

tmatrix <- scale(toydata)                          	# Note: 4 
tcenter <- attr(tmatrix, "scaled:center")        	# Note: 5 
tscale<-attr(tmatrix, "scaled:scale")
kbest.t <- 3
tclusters <- kmeans(tmatrix, kbest.t, nstart=100, iter.max=100)   	# Note: 6 

tclusters$size              	# Note: 7 
[1] 100 101  99

unscale <- function(scaledpt, centervec, scalevec) {    	# Note: 8 
   scaledpt*scalevec + centervec
}

> unscale(tclusters$centers[1,], tcenter, tscale)   	# Note: 9 
       x1        x2        x3
 9.978961 -3.097584  4.864689
> mean2
[1] 10 -3  5

> unscale(tclusters$centers[2,], tcenter, tscale)   	# Note: 10 
       x1        x2        x3
-4.979523 -4.927404 -4.908949
> mean3
[1] -5 -5 -5

> unscale(tclusters$centers[3,], tcenter, tscale)    	# Note: 11 
       x1        x2        x3
1.0003356 1.3037825 0.9571058
> mean1
[1] 1 1 1

> assign_cluster(rnorm.multidim(1, mean1, sd1),  	# Note: 12 
                tclusters$centers,
                tcenter, tscale)
3                                                 	# Note: 13 
3

> assign_cluster(rnorm.multidim(1, mean2, sd1),   	# Note: 14 
                tclusters$centers,
                tcenter, tscale)
1                                                	# Note: 15 
1

> assign_cluster(rnorm.multidim(1, mean3, sd1),     	# Note: 16 
                tclusters$centers,
                tcenter, tscale)
2                                          	# Note: 17 
2

# Note 1: 
#   A function to generate n points drawn from a 
#   multidimensional Gaussian distribution with 
#   centroid mean and standard deviation sd. The 
#   dimension of the distribution is given by the 
#   length of the vector mean. 

# Note 2: 
#   The parameters for three Gaussian 
#   distributions. 

# Note 3: 
#   Create a dataset with 100 points each drawn 
#   from the above distributions. 

# Note 4: 
#   Scale the dataset. 

# Note 5: 
#   Store the centering and scaling parameters for 
#   future use. 

# Note 6: 
#   Cluster the dataset, using k-means with three 
#   clusters. 

# Note 7: 
#   The resulting clusters are about the right 
#   size. 

# Note 8: 
#   A function to “unscale” data points (put them 
#   back in the coordinates of the original 
#   dataset). 

# Note 9: 
#   Unscale the first centroid. It corresponds to 
#   our original distribution 2. 

# Note 10: 
#   The second centroid corresponds to the 
#   original distribution 3. 

# Note 11: 
#   The third centroid corresponds to the original 
#   distribution 1. 

# Note 12: 
#   Generate a random point from the original 
#   distribution 1 and assign it to one of the 
#   discovered clusters. 

# Note 13: 
#   It’s assigned to cluster 3, as we would 
#   expect. 

# Note 14: 
#   Generate a random point from the original 
#   distribution 2 and assign it. 

# Note 15: 
#   It’s assigned to cluster 1. 

# Note 16: 
#   Generate a random point from the original 
#   distribution 3 and assign it. 

# Note 17: 
#   It’s assigned to cluster 2. 

