# example 3.7 of section 3.2.1 
# (example 3.7 of section 3.2.1)  : Exploring data : Spotting problems using graphics and visualization : Visually checking distributions for a single variable 
# Title: Producing a density plot 

library(scales) 	# Note: 1 

ggplot(custdata) + geom_density(aes(x=income)) +
   scale_x_continuous(labels=dollar) 	# Note: 2

# Note 1: 
#   The scales package brings in the dollar 
#   scale notation. 

# Note 2: 
#   Set the x-axis labels to 
#   dollars. 

