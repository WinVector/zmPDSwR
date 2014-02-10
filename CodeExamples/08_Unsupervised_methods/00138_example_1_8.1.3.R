# example:1_8.1.3 
# example:1 : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: Hierarchical Clustering 

d <- dist(pmatrix, method="euclidean")   	# Note: 1 
pfit <- hclust(d, method="ward")         	# Note: 2 
plot(pfit, labels=protein$Country)      	# Note: 3 

# Note 1: 
#    
#   Create the distance matrix. 
#    

# Note 2: 
#    
#   Do the clustering. 
#    

# Note 3: 
#    
#   Plot the dendrogram. 
#    

