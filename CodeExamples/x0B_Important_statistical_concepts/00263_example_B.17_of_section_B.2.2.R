# example B.17 of section B.2.2 
# (example B.17 of section B.2.2)  : Important statistical concepts : Statistical theory : A/B tests 
# Title: Bayesian estimate of the posterior tail mass 

print(pbeta( 	# Note: 1 
   aConversionRate, 	# Note: 2 
   shape1=commonRate+tab['B','1'], 	# Note: 3 
   shape2=(1-commonRate)+tab['B','0'])) 	# Note: 4 
## [1] 4.731817e-06

# Note 1: 
#   pbeta() functionUse pbeta() to estimate how likely 
#   different observed conversion rates are. 

# Note 2: 
#   Ask for the probability of seeing a 
#   conversion rate no larger than aConversionRate. 

# Note 3: 
#   Estimate conversion count as prior 
#   commonRate plus the B observations. 

# Note 4: 
#   Estimate nonconversion count as prior 
#   1-commonRate plus the B observations. 

