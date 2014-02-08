# informalexample:4_8.1.1 
# informalexample:4 : Unsupervised methods : Cluster analysis : Distances 
# Title: Cosine similarity 

dot(x, y) <- sum( x[1]*y[1] + x[2]*y[2] + ... )
cossim(x, y) <- dot(x, y)/(sqrt(dot(x,x)*dot(y,y)))

