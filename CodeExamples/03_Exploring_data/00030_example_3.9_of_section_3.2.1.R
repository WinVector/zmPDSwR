# example 3.9 of section 3.2.1 
# (example 3.9 of section 3.2.1)  : Exploring data : Spotting problems using graphics and visualization : Visually checking distributions for a single variable 
# Title: Producing a horizontal bar chart 

ggplot(custdata) +
   geom_bar(aes(x=state.of.res), fill="gray") +  	# Note: 1 
   coord_flip() + 	# Note: 2 
   theme(axis.text.y=element_text(size=rel(0.8)))  	# Note: 3

# Note 1: 
#   Plot bar chart as before: state.of.res 
#   is on x axis, count is on y-axis. 

# Note 2: 
#   Flip the x and y axes: state.of.res is 
#   now on the y-axis. 

# Note 3: 
#   Reduce the size of the y-axis tick 
#   labels to 80% of default size for legibility. 

