# example 4.8 of section 4.1.2 
# (example 4.8 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 
# Title: Summarizing age 

> summary(custdata$age)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
    0.0    38.0    50.0    51.7    64.0   146.7
> meanage <- mean(custdata$age)  	# Note: 1 
> stdage <- sd(custdata$age)     	# Note: 2 
> meanage
[1] 51.69981
> stdage
[1] 18.86343
> custdata$age.normalized <- (custdata$age-meanage)/stdage 	# Note: 3 
> summary(custdata$age.normalized)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
-2.74100 -0.72630 -0.09011  0.00000  0.65210  5.03500

# Note 1: 
#   Take the mean. 

# Note 2: 
#   Take the standard deviation. 

# Note 3: 
#   Use the mean value as the origin (or 
#   reference point) and rescale the distance from the 
#   mean by the standard deviation. 

