# example:5_3.2.2 
# example:5 : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: 
                    Plotting distribution of healt.ins as a function of marital.stat 


                    Plotting distribution of healt.ins as a function of marital.stat
                    ggplot(custdata) + geom_bar(aes(x=marital.stat,
   fill=health.ins)) 	# Note: 1 

ggplot(custdata) + geom_bar(aes(x=marital.stat,
   fill=health.ins),
   position="dodge")      	# Note: 2 

ggplot(custdata) + geom_bar(aes(x=marital.stat,
   fill=health.ins),
   position="fill")        	# Note: 3 

# Note 1: 
#    Stacked bar chart, the 
#   default  

# Note 2: 
#    Side-by-side bar chart  

# Note 3: 
#    Filled bar chart  

