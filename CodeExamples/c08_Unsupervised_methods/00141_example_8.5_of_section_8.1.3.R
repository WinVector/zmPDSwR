# example 8.5 of section 8.1.3 
# (example 8.5 of section 8.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: Projecting the clusters on the first two principal components 

library(ggplot2)
princ <- prcomp(pmatrix)    	# Note: 1 
nComp <- 2
project <- predict(princ, newdata=pmatrix)[,1:nComp]      	# Note: 2 
project.plus <- cbind(as.data.frame(project),             	# Note: 3 
                     cluster=as.factor(groups),
                     country=protein$Country)
ggplot(project.plus, aes(x=PC1, y=PC2)) +                	# Note: 4 
  geom_point(aes(shape=cluster)) +
  geom_text(aes(label=country),
            hjust=0, vjust=1)

# Note 1: 
#   Calculate the principal components of the 
#   data. 

# Note 2: 
#   The predict() function will rotate the data 
#   into the space described by the principal 
#   components. We only want the projection on the 
#   first two axes. 

# Note 3: 
#   Create a data frame with the transformed 
#   data, along with the cluster label and country 
#   label of each point. 

# Note 4: 
#   Plot it. 

