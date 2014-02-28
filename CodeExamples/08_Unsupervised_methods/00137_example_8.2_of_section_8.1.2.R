# example 8.2 of section 8.1.2 
# (example 8.2 of section 8.1.2)  : Unsupervised methods : Cluster analysis : Preparing the data 
# Title: Rescaling the dataset 

vars.to.use <- colnames(protein)[-1]       	# Note: 1 
pmatrix <- scale(protein[,vars.to.use])    	# Note: 2 
pcenter <- attr(pmatrix, "scaled:center")  	# Note: 3 
pscale <- attr(pmatrix, "scaled:scale")

# Note 1: 
#   Use all the columns except the first 
#   (Country). 

# Note 2: 
#   The output of scale() is a matrix. For the 
#   purposes of this chapter, you can think of a 
#   matrix as a data frame with all numeric columns 
#   (this isn’t strictly true, but it’s close enough). 

# Note 3: 
#   The scale() function annotates its output 
#   with two attributes—scaled:center returns the mean 
#   values of all the columns, and scaled:scale 
#   returns the standard deviations. You’ll store 
#   these away so you can “unscale” the data 
#   later. 

