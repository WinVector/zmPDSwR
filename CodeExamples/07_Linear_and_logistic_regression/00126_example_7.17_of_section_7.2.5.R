# example 7.17 of section 7.2.5 
# (example 7.17 of section 7.2.5)  : Linear and logistic regression : Using logistic regression : Reading the model summary and characterizing coefficients 
# Title: Computing deviance 

loglikelihood <- function(y, py) {                                 	# Note: 1 
  sum(y * log(py) + (1-y)*log(1 - py))
}

pnull <- mean(as.numeric(train$atRisk))                            	# Note: 2 
null.dev <- -2*loglikelihood(as.numeric(train$atRisk), pnull)      	# Note: 3 

> pnull
[1] 0.01920912
> null.dev
[1] 2698.716
> model$null.deviance                                                 	# Note: 4 
[1] 2698.716

pred <- predict(model, newdata=train, type="response")   	# Note: 5 
resid.dev <- -2*loglikelihood(as.numeric(train$atRisk), pred)      	# Note: 6 

> resid.dev
[1] 2462.992
> model$deviance                                                      	# Note: 7 
[1] 2462.992

testy <- as.numeric(test$atRisk)                                   	# Note: 8 
testpred <- predict(model, newdata=test,
                        type="response")
pnull.test <- mean(testy)
null.dev.test <- -2*loglikelihood(testy, pnull.test)
resid.dev.test <- -2*loglikelihood(testy, testpred)

> pnull.test
[1] 0.0172713
> null.dev.test
[1] 2110.91
> resid.dev.test
[1] 1947.094

# Note 1: 
#   Function to calculate the log likelihood of 
#   a dataset. Variable y is the outcome 
#   in numeric form (1 for positive examples, 0 for 
#   negative). Variable py is the 
#   predicted probability that 
#   y==1. 

# Note 2: 
#   Calculate rate of positive examples in 
#   dataset. 

# Note 3: 
#   Calculate null deviance. 

# Note 4: 
#   For training data, the null deviance is 
#   stored in the slot model$null.deviance. 

# Note 5: 
#   Predict probabilities for training 
#   data. 

# Note 6: 
#   Calculate deviance of model for training 
#   data. 

# Note 7: 
#   For training data, model deviance is stored 
#   in the slot model$deviance. 

# Note 8: 
#   Calculate null deviance and residual 
#   deviance for test data. 

