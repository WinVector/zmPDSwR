# example 9.13 of section 9.2.4 
# (example 9.13 of section 9.2.4)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : Using GAM on actual data 
# Title: Checking GAM model performance on hold-out data 

pred.lin <- predict(linmodel, newdata=test)  	# Note: 1 
pred.glin <- predict(glinmodel, newdata=test)

cor(pred.lin, test$DBWT)^2           	# Note: 2 
# [1] 0.0616812
cor(pred.glin, test$DBWT)^2
# [1] 0.08857426

# Note 1: 
#   Run both the linear model and the GAM on the test 
#   data. 

# Note 2: 
#   Calculate R-squared for both 
#   models. 

