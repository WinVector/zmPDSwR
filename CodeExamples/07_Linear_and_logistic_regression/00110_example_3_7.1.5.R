# example:3_7.1.5 
# example:3 : Linear and logistic regression : Using linear regression : Reading the model summary and characterizing coefficient
                                quality 
# Title: Calculating the residual standard error 

modelResidualError <- sqrt(sum(residuals(model)^2)/df)

