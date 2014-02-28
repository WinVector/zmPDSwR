# example 8.13 of section 8.1.5 
# (example 8.13 of section 8.1.5)  : Unsupervised methods : Cluster analysis : Assigning new points to clusters 
# Title: A function to assign points to a cluster 

assign_cluster <- function(newpt, centers, xcenter=0, xscale=1) { 	# Note: 1 
   xpt <- (newpt - xcenter)/xscale                                	# Note: 2 
   dists <- apply(centers, 1, FUN=function(c0){sqr_edist(c0, xpt)})  	# Note: 3 
   which.min(dists)                                                 	# Note: 4 
 }

# Note 1: 
#   A function to assign a new data point newpt to 
#   a clustering described by centers, a matrix where 
#   each row is a cluster centroid. If the data was 
#   scaled (using scale()) before clustering, then 
#   xcenter and xscale are the scaled:center and 
#   scaled:scale attributes, respectively. 

# Note 2: 
#   Center and scale the new data point. 

# Note 3: 
#   Calculate how far the new data point is from 
#   each of the cluster centers. 

# Note 4: 
#   Return the cluster number of the closest 
#   centroid. 

