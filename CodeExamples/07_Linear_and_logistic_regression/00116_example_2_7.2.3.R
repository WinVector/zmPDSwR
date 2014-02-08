# example:2_7.2.3 
# example:2 : Linear and logistic regression : Using logistic regression : Making predictions 
# Title: Plotting distribution of prediction score grouped by known outcome 

library(ggplot2)
ggplot(train, aes(x=pred, color=atRisk, linetype=atRisk)) +
       geom_density()

