# example:6_7.2.5 
# example:6 : Linear and logistic regression : Using logistic regression : Reading the model summary and characterizing coefficients 
# Title: Calculating the Akaike information criterion 

aic <- 2*(length(model$coefficients) -
         loglikelihood(as.numeric(train$atRisk), pred))
> aic
[1] 2490.992

