# example 7.16 of section 7.2.5 
# (example 7.16 of section 7.2.5)  : Linear and logistic regression : Using logistic regression : Reading the model summary and characterizing coefficients 
# Title: Calculating deviance residuals 

pred <- predict(model, newdata=train, type="response") 	# Note: 1 
llcomponents <- function(y, py) {                      	# Note: 2 
  y*log(py) + (1-y)*log(1-py)
}

edev <- sign(as.numeric(train$atRisk) - pred) *        	# Note: 3 
  sqrt(-2*llcomponents(as.numeric(train$atRisk), pred))

> summary(edev)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
-0.9732 -0.1818 -0.1511 -0.1244 -0.1358  3.2640

# Note 1: 
#   Create vector of predictions for training 
#   data. 

# Note 2: 
#   Function to return the log likelihoods for 
#   each data point. Argument y is the true outcome 
#   (as a numeric variable, 0/1); argument py is the 
#   predicted probability. 

# Note 3: 
#   Calculate deviance residuals. 

