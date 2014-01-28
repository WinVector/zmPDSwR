# informalexample:7_B.2.2 
# informalexample:7 : Some Important Statistical Concepts : Statistical theory : A/B tests 
library('ggplot2')
plt <- data.frame(x=seq(from=0.04,to=0.07,length.out=301))
plt$density <- dbeta(plt$x,
   shape1=commonRate+tab['B','1'],
   shape2=(1-commonRate)+tab['B','0'])
ggplot(dat=plt) + 
   geom_line(aes(x=x,y=density)) + 
   geom_vline(aes(xintercept=bConversionRate)) +
   geom_vline(aes(xintercept=aConversionRate),linetype=2)
