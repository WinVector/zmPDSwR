# example B.11 of section B.1.4 
# (example B.11 of section B.1.4)  : Important statistical concepts : Distributions : Binomial distribution 
# Title: Working with the binomial cdf 

# because this is a discrete probability distribution, 
# pbinom and qbinom are not exact inverses of each other

# this direction works
pbinom(45, nflips, 0.5)
# [1] 0.1841008
qbinom(0.1841008, nflips, 0.5)
# [1] 45

# this direction won't be exact
qbinom(0.75, nflips, 0.5)
# [1] 53
pbinom(53, nflips, 0.5)
# [1] 0.7579408

