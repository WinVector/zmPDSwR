# example 8.8 of section 8.1.3 
# (example 8.8 of section 8.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: The Calinski-Harabasz index 

totss <- function(dmatrix) {                 	# Note: 1 
  grandmean <- apply(dmatrix, 2, FUN=mean)
  sum(apply(dmatrix, 1, FUN=function(row){sqr_edist(row, grandmean)}))
}


ch_criterion <- function(dmatrix, kmax, method="kmeans") {     	# Note: 2 
  if(!(method %in% c("kmeans", "hclust"))) {
    stop("method must be one of c('kmeans', 'hclust')")
  }
  npts <- dim(dmatrix)[1]  # number of rows.

  totss <- totss(dmatrix)                                       	# Note: 3 

  wss <- numeric(kmax)
  crit <- numeric(kmax)
  wss[1] <- (npts-1)*sum(apply(dmatrix, 2, var))                	# Note: 4 
  for(k in 2:kmax) {                                           	# Note: 5 
    if(method=="kmeans") {
      clustering<-kmeans(dmatrix, k, nstart=10, iter.max=100)
      wss[k] <- clustering$tot.withinss
    }else {  # hclust                                          	# Note: 6 
      d <- dist(dmatrix, method="euclidean")
      pfit <- hclust(d, method="ward")
      labels <- cutree(pfit, k=k)
      wss[k] <- wss.total(dmatrix, labels)
    }
  }
  bss <- totss - wss                                            	# Note: 7 
  crit.num <- bss/(0:(kmax-1))                                  	# Note: 8 
  crit.denom <- wss/(npts - 1:kmax)                             	# Note: 9 
  list(crit = crit.num/crit.denom, wss = wss, totss = totss)   	# Note: 10 
}

# Note 1: 
#   Convenience function to calculate the total 
#   sum of squares. 

# Note 2: 
#   A function to calculate the CH index for a 
#   number of clusters from 1 to kmax. 

# Note 3: 
#   The total sum of squares is independent of 
#   the clustering. 

# Note 4: 
#   Calculate WSS for k=1 (which is really just 
#   total sum of squares). 

# Note 5: 
#   Calculate WSS for k from 2 to kmax. kmeans() 
#   returns the total WSS as one of its 
#   outputs. 

# Note 6: 
#   For hclust(), calculate total WSS by 
#   hand. 

# Note 7: 
#   Calculate BSS for k from 1 to kmax. 

# Note 8: 
#   Normalize BSS by k-1. 

# Note 9: 
#   Normalize WSS by npts - k. 

# Note 10: 
#   Return a vector of CH indices and of WSS for 
#   k from 1 to kmax. Also return total sum of 
#   squares. 

