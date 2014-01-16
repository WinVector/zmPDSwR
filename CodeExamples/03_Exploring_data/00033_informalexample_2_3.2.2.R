# informalexample:2_3.2.2 
# informalexample:2 : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
custdata2 <- subset(custdata,
   (custdata$age > 0 & custdata$age < 100
   & custdata$income > 0))                  	# Note: 1 

cor(custdata2$age, custdata2$income) 	# Note: 2 

[1] -0.02240845 	# Note: 3 

# Note 1: 
#   Only consider subset of data with reasonable age and income 
#   values 

# Note 2: 
#   Get correlation of age and income 

# Note 3: 
#   Resulting correlation 
