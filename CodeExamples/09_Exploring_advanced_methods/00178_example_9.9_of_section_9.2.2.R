# example 9.9 of section 9.2.2 
# (example 9.9 of section 9.2.2)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : A one-dimensional regression example 
# Title: Comparing linear regression and GAM performance 

> actual <- test$y
> pred.lin <- predict(lin.model, newdata=test)  	# Note: 1 
> pred.glin <- predict(glin.model, newdata=test)
> resid.lin <- actual-pred.lin
> resid.glin <- actual-pred.glin

> sqrt(mean(resid.lin^2))   	# Note: 2 
[1] 2.792653
> sqrt(mean(resid.glin^2))
[1] 1.401399

> cor(actual, pred.lin)^2   	# Note: 3 
[1] 0.1543172
> cor(actual, pred.glin)^2
[1] 0.7828869

# Note 1: 
#   Call both models on the test 
#   data. 

# Note 2: 
#   Compare the RMSE of the linear model and the GAM 
#   on the test data. 

# Note 3: 
#   Compare the R-squared of the linear model and the 
#   GAM on test data. 

