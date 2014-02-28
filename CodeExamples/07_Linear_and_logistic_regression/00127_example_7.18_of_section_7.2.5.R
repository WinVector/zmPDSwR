# example 7.18 of section 7.2.5 
# (example 7.18 of section 7.2.5)  : Linear and logistic regression : Using logistic regression : Reading the model summary and characterizing coefficients 
# Title: Calculating the significance of the observed fit 

df.null <- dim(train)[[1]] - 1                            	# Note: 1 
df.model <- dim(train)[[1]] - length(model$coefficients)  	# Note: 2 

> df.null
[1] 14211
> df.model
[1] 14198

delDev <- null.dev - resid.dev                            	# Note: 3 
deldf <- df.null - df.model
p <- pchisq(delDev, deldf, lower.tail=F)                  	# Note: 4 

> delDev
[1] 235.724
> deldf
[1] 13
> p
[1] 5.84896e-43

# Note 1: 
#   Null model has (number of data points - 1) 
#   degrees of freedom. 

# Note 2: 
#   Fitted model has (number of data points - 
#   number of coefficients) degrees of freedom. 

# Note 3: 
#   Compute difference in deviances and 
#   difference in degrees of freedom. 

# Note 4: 
#   Estimate probability of seeing the observed 
#   difference in deviances under null model (the 
#   p-value) using chi-squared distribution. 

