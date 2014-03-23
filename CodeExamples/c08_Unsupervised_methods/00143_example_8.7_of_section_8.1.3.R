# example 8.7 of section 8.1.3 
# (example 8.7 of section 8.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: Calculating total within sum of squares 

sqr_edist <- function(x, y) {             	# Note: 1 
  sum((x-y)^2)
}

wss.cluster <- function(clustermat) {     	# Note: 2 
  c0 <- apply(clustermat, 2, FUN=mean)    	# Note: 3 
  sum(apply(clustermat, 1, FUN=function(row){sqr_edist(row,c0)}))     	# Note: 4 
}

wss.total <- function(dmatrix, labels) {                               	# Note: 5 
  wsstot <- 0
  k <- length(unique(labels))
  for(i in 1:k)
    wsstot <- wsstot + wss.cluster(subset(dmatrix, labels==i))         	# Note: 6 
  wsstot
}

# Note 1: 
#   Function to calculate squared distance 
#   between two vectors. 

# Note 2: 
#   Function to calculate the WSS for a single 
#   cluster, which is represented as a matrix (one row 
#   for every point). 

# Note 3: 
#   Calculate the centroid of the cluster (the 
#   mean of all the points). 

# Note 4: 
#   Calculate the squared difference of every 
#   point in the cluster from the centroid, and sum 
#   all the distances. 

# Note 5: 
#   Function to compute the total WSS from a set 
#   of data points and cluster labels. 

# Note 6: 
#   Extract each cluster, calculate the 
#   cluster’s WSS, and sum all the values. 

