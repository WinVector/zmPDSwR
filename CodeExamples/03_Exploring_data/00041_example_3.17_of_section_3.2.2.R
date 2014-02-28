# example 3.17 of section 3.2.2 
# (example 3.17 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Plotting a bar chart with and without facets 

ggplot(custdata2) +                                          	# Note: 1 
   geom_bar(aes(x=housing.type, fill=marital.stat ),
      position="dodge") +
   theme(axis.text.x = element_text(angle = 45, hjust = 1))   	# Note: 2 

ggplot(custdata2) +                                          	# Note: 3 
   geom_bar(aes(x=marital.stat), position="dodge",
      fill="darkgray") +
   facet_wrap(~housing.type, scales="free_y") +               	# Note: 4 
   theme(axis.text.x = element_text(angle = 45, hjust = 1))   	# Note: 5

# Note 1: 
#   Side-by-side bar chart. 

# Note 2: 
#   coord_flip commandTilt the x-axis labels so they 
#   don’t overlap. You can also use coord_flip() to rotate the graph, as we 
#   saw previously. Some prefer coord_flip() because the theme() layer is 
#   complicated to use. 

# Note 3: 
#   The faceted bar chart. 

# Note 4: 
#   Facet the graph by housing.type. The scales="free_y" argument specifies that each facet has 
#   an independently scaled y-axis (the default is that all facets have 
#   the same scales on both axes). The argument free_x would free the 
#   x-axis scaling, and the argument free frees both axes. 

# Note 5: 
#   As of this writing, 
#   facet_wrap is incompatible with coord_flip, so we have to tilt the 
#   x-axis labels. 

