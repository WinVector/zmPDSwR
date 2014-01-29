# informalexample:10_7.2.5 
# informalexample:10 : Linear and logistic regression : Using logistic regression : Reading the model summary and characterizing coefficients 
aic <- 2*(length(model$coefficients) -
         loglikelihood(as.numeric(train$atRisk), pred))
> aic
[1] 2490.992
