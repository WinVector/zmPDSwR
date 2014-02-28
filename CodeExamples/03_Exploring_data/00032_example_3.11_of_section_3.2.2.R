# example 3.11 of section 3.2.2 
# (example 3.11 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Producing a line plot 

x <- runif(100)   	# Note: 1 
y <- x^2 + 0.2*x   	# Note: 2 
ggplot(data.frame(x=x,y=y), aes(x=x,y=y)) + geom_line()  	# Note: 3

# Note 1: 
#   First, generate the data for this example. 
#   The x variable is uniformly randomly distributed 
#   between 0 and 1. 

# Note 2: 
#   The y variable is a 
#   quadratic function of x. 

# Note 3: 
#   Plot the line plot. 

