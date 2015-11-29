# example B.3 of section B.1.1 
# (example B.3 of section B.1.1)  : Important statistical concepts : Distributions : Normal distribution 
# Title: Working with the normal cdf 

# --- estimate probabilities (areas) under the curve ---

# 50% of the observations will be less than the mean
pnorm(0)
# [1] 0.5

# about 2.3% of all observations are more than 2 standard
# deviations below the mean
pnorm(-2)
# [1] 0.02275013

# about 95.4% of all observations are within 2 standard deviations
# from the mean
pnorm(2) - pnorm(-2)
# [1] 0.9544997

