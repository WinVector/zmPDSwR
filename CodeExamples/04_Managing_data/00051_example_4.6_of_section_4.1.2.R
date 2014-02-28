# example 4.6 of section 4.1.2 
# (example 4.6 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 
# Title: Converting age into ranges 

> brks <- c(0, 25, 65, Inf)  	# Note: 1 
> custdata$age.range <- cut(custdata$age,
    breaks=brks, include.lowest=T) 	# Note: 2 
> summary(custdata$age.range) 	# Note: 3 
  [0,25]  (25,65] (65,Inf]
      56      732      212

# Note 1: 
#   Select the age ranges of interest. The upper 
#   and lower bounds should encompass the full range 
#   of the data. 

# Note 2: 
#   Cut the data into age ranges. The 
#   include.lowest=T argument makes sure that zero age 
#   data is included in the lowest age range category. 
#   By default it would be excluded. 

# Note 3: 
#   The output of cut() is a factor variable. 

