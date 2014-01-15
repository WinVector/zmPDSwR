# informalexample:2_7.2.3 
# informalexample:2 : Linear and logistic regression : Using logistic regression : Making predictions 
library(ggplot2)
ggplot(train, aes(x=pred, color=atRisk, linetype=atRisk)) +
       geom_density()
