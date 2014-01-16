# example:1_9.4.2 
# example:1 : Exploring advanced methods : Using support vector machines to model complicated decision
            boundaries : Trying an SVM on artificial example data 
> library('kernlab')
> data('spirals')  	# Note: 1 
> sc <- specc(spirals, centers = 2) 	# Note: 2 
> s <- data.frame(x=spirals[,1],y=spirals[,2],class=as.numeric(sc)) 	# Note: 3 
> library('ggplot2')
> ggplot(data=s) +
   geom_point(aes(x=x,y=y,shape=as.factor(class))) +
   coord_fixed() 	# Note: 4 

# Note 1: 
#   Load the kernlab kernel and 
#   support vector machine package and then ask that the included example 
#   “spirals” be made available 

# Note 2: 
#   Use kernlab’s spectral 
#   clustering routine to identify the two different spirals in the example 
#   dataset 

# Note 3: 
#   Combine the spiral coordinates 
#   and the spiral label into a data frame 

# Note 4: 
#   Plot the spirals with class 
#   labels 
