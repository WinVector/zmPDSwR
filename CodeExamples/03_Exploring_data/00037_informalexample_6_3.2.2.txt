# informalexample:6_3.2.2 
# informalexample:6 : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
ggplot(custdata2, aes(x=age, y=as.numeric(health.ins))) + 	# Note: 1 
   geom_point(position=position_jitter(w=0.05, h=0.05)) +  	# Note: 2 
   geom_smooth() 	# Note: 3 

# Note 1: 
#   The boolean variable health.ins must be converted to a 0/1 variable 
#   using as.numeric 

# Note 2: 
#   Since y values can only be zero or one, add a small jitter to get a 
#   sense of data density 

# Note 3: 
#   Add smoothing curve 
