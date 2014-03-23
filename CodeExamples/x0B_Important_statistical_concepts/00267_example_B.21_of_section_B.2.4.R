# example B.21 of section B.2.4 
# (example B.21 of section B.2.4)  : Important statistical concepts : Statistical theory : Specialized statistical tests 
# Title: Building synthetic uncorrelated income example 

set.seed(235236) 	# Note: 1 
d <- data.frame(EarnedIncome=100000*rlnorm(100),
                 CapitalGains=100000*rlnorm(100))  	# Note: 2 
print(with(d,cor(EarnedIncome,CapitalGains)))
# [1] -0.01066116 	# Note: 3

# Note 1: 
#   Set the pseudo-random seed to a known 
#   value so the demonstration is repeatable. 

# Note 2: 
#   Generate our synthetic data. 

# Note 3: 
#   The correlation is -0.01, which is very near 0—indicating (as designed) no relation. 

