# informalexample:2_3.2.1 
# informalexample:2 : Exploring data : Spotting problems using graphics and visualization : Visually checking distributions for a single variable 
# Title: Density plots show where data is concentrated. This plot also highlights
                        a population of higher-income customers. 

library(scales) 	# Note: 1 

ggplot(custdata) + geom_density(aes(x=income)) +
   scale_x_continuous(labels=dollar) 	# Note: 2 

# Note 1: 
#    The scales package brings in the dollar 
#   scale notation.  

# Note 2: 
#    Set the x-axis labels to 
#   dollars.  

