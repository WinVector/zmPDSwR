# informalexample:1_3.2.1 
# informalexample:1 : Exploring data : Spotting problems using graphics and visualization : Visually checking distributions for a single variable 
# Title: A histogram tells you where your data is concentrated. It also visually
                        highlights outliers and anomalies. 

library(ggplot2)     	# Note: 1 

ggplot(custdata) +
   geom_histogram(aes(x=age),
   binwidth=5, fill="gray") 	# Note: 2 

# Note 1: 
#    Load the ggplot2 library, if you haven’t 
#   already done so.  

# Note 2: 
#    The binwidth parameter tells the 
#   geom_histogram call how to make bins of five-year intervals (default is 
#   datarange/30). The fill parameter specifies the color of the histogram 
#   bars (default: black).  

