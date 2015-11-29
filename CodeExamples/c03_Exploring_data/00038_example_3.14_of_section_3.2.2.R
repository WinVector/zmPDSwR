# example 3.14 of section 3.2.2 
# (example 3.14 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Producing a hexbin plot 

library(hexbin) 	# Note: 1 

ggplot(custdata2, aes(x=age, y=income)) +
   geom_hex(binwidth=c(5, 10000)) +   	# Note: 2 
   geom_smooth(color="white", se=F) +  	# Note: 3 
   ylim(0,200000)

# Note 1: 
#   Load hexbin library. 

# Note 2: 
#   Create hexbin with age binned into 5-year 
#   increments, income in increments of $10,000. 

# Note 3: 
#   Add smoothing curve in white; suppress 
#   standard error ribbon (se=F). 

