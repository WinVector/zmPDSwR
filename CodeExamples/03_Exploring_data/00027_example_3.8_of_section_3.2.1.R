# example 3.8 of section 3.2.1 
# (example 3.8 of section 3.2.1)  : Exploring data : Spotting problems using graphics and visualization : Visually checking distributions for a single variable 
# Title: Creating a log-scaled density plot 

ggplot(custdata) + geom_density(aes(x=income)) +
   scale_x_log10(breaks=c(100,1000,10000,100000), labels=dollar) +  	# Note: 1 
   annotation_logticks(sides="bt")  	# Note: 2

# Note 1: 
#   Set the x-axis to be in log10 scale, with 
#   manually set tick points and labels as dollars. 

# Note 2: 
#   Add log-scaled tick marks to the top and 
#   bottom of the graph. 

