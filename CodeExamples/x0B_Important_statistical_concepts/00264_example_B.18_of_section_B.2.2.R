# example B.18 of section B.2.2 
# (example B.18 of section B.2.2)  : Important statistical concepts : Statistical theory : A/B tests 
# Title: Plotting the posterior distribution of the B group 

library('ggplot2')
plt <- data.frame(x=seq(from=0.04,to=0.07,length.out=301))
plt$density <- dbeta(plt$x,
   shape1=commonRate+tab['B','1'],
   shape2=(1-commonRate)+tab['B','0'])
ggplot(dat=plt) + 
   geom_line(aes(x=x,y=density)) + 
   geom_vline(aes(xintercept=bConversionRate)) +
   geom_vline(aes(xintercept=aConversionRate),linetype=2)

