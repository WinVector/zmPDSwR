# example:2_7.1.5 
# example:2 : Linear and logistic regression : Using linear regression : Reading the model summary and characterizing coefficient
                                quality 
# Title: Calculating the degrees of freedom 

df <- dim(dtrain)[1] - dim(summary(model)$coefficients)[1]

