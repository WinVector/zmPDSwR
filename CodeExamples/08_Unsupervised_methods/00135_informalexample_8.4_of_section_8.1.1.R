# informalexample 8.4 of section 8.1.1 
# (informalexample 8.4 of section 8.1.1)  : Unsupervised methods : Cluster analysis : Distances 

dot(x, y) <- sum( x[1]*y[1] + x[2]*y[2] + ... )
cossim(x, y) <- dot(x, y)/(sqrt(dot(x,x)*dot(y,y)))

