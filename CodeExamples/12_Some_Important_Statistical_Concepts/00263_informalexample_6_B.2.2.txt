# informalexample:6_B.2.2 
# informalexample:6 : Some Important Statistical Concepts : Statistical theory : A/B tests 
print(pbeta( 	# Note: 1 
   aConversionRate, 	# Note: 2 
   shape1=commonRate+tab['B','1'], 	# Note: 3 
   shape2=(1-commonRate)+tab['B','0'])) 	# Note: 4 
## [1] 4.731817e-06

# Note 1: 
#   Use pbeta() to estimate how likely different 
#   observed conversion rates are 

# Note 2: 
#   Ask for the probability of seeing a 
#   conversion rate no larger than aConverionRate 

# Note 3: 
#   Estimate conversion count as prior 
#   commonRate plus the B observations 

# Note 4: 
#   Estimate non-conversion count as prior 
#   1-commonRate plus the B observations 
