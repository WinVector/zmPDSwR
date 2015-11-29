# example 8.17 of section 8.2.3 
# (example 8.17 of section 8.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Examining the size distribution 

> quantile(basketSizes, probs=seq(0,1,0.1))     	# Note: 1 
   0%   10%   20%   30%   40%   50%   60%   70%   80%   90%  100%
    1     1     1     1     1     1     2     3     5    13 10253
> library(ggplot2)                              	# Note: 2 
> ggplot(data.frame(count=basketSizes)) +
  geom_density(aes(x=count), binwidth=1) +
  scale_x_log10()

# Note 1: 
#   Look at the basket size distribution, in 10% 
#   increments. 

# Note 2: 
#   Plot the distribution to get a better 
#   look. 

