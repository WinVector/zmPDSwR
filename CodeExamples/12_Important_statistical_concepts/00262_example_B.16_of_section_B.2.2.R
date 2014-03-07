# example B.16 of section B.2.2 
# (example B.16 of section B.2.2)  : Important statistical concepts : Statistical theory : A/B tests 
# Title: Computing frequentist significance 

print(pbinom( 	# Note: 1 
   lower.tail=F, 	# Note: 2 
   q=tab['B','1']-1, 	# Note: 3 
   size=sum(tab['B',]), 	# Note: 4 
   prob=commonRate 	# Note: 5 
   )) 
## [1] 3.153319e-05

# Note 1: 
#   Use the pbinom() call to calculate how 
#   likely different observed counts are. 

# Note 2: 
#   Signal we want the probability of being 
#   greater than a given q. 

# Note 3: 
#   Ask for the probability of seeing at least as many conversions as our observed B groups 
#   did. 

# Note 4: 
#   Specify the total number of trials as 
#   equal to what we saw in our B group. 

# Note 5: 
#   Specify the conversion probability at the 
#   estimated common rate. 

