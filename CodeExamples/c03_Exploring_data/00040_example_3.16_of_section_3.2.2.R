# example 3.16 of section 3.2.2 
# (example 3.16 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Plotting data with a rug 

ggplot(custdata, aes(x=marital.stat)) +
   geom_bar(aes(fill=health.ins), position="fill") +
   geom_point(aes(y=-0.05), size=0.75, alpha=0.3, 	# Note: 1 
   position=position_jitter(h=0.01)) 	# Note: 2

# Note 1: 
#   Set the points just under the y-axis, 
#   three-quarters of default size, and make them slightly transparent with 
#   the alpha parameter. 

# Note 2: 
#   Jitter the points slightly for 
#   legibility. 

