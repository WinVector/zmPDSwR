# example A.15 of section A.3.4 
# (example A.15 of section A.3.4)  : Working with R and other tools : Using databases with R : An example SQL data transformation task 
# Title: Showing our hotel model results 

library('ggplot2')
ggplot(data=joined,aes(x=price,y=pickup)) +
  geom_point() + geom_jitter() + geom_smooth(method='lm')
print(summary(lm(pickup~price,data=joined)))
#
#Call:
#lm(formula = pickup ~ price, data = joined)
#
#Residuals:
#   Min     1Q Median     3Q    Max
#-4.614 -2.812 -1.213  3.387  6.386
#
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)
#(Intercept) 11.00765    7.98736   1.378    0.198
#price       -0.02798    0.03190  -0.877    0.401
#
#Residual standard error: 4.21 on 10 degrees of freedom
#Multiple R-squared:  0.07144,  Adjusted R-squared:  -0.02142
#F-statistic: 0.7693 on 1 and 10 DF,  p-value: 0.401

