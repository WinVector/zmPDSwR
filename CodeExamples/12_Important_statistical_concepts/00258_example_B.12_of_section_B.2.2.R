# example B.12 of section B.2.2 
# (example B.12 of section B.2.2)  : Important statistical concepts : Statistical theory : A/B tests 
# Title: Building simulated A/B test data 

set.seed(123515)
d <- rbind( 	# Note: 1 
   data.frame(group='A',converted=rbinom(100000,size=1,p=0.05)), 	# Note: 2 
   data.frame(group='B',converted=rbinom(10000,size=1,p=0.055)) 	# Note: 3 
)

# Note 1: 
#   Build a data frame to store simulated 
#   examples. 

# Note 2: 
#   Add 100,000 examples from the A group 
#   simulating a conversion rate of 5%. 

# Note 3: 
#   Add 10,000 examples from the B group 
#   simulating a conversion rate of 5.5%. 

