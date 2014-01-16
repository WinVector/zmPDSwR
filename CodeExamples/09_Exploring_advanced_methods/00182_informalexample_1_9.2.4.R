# informalexample:1_9.2.4 
# informalexample:1 : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone
            relationships : Using GAM on actual data 
pred.lin <- predict(linmodel, newdata=test)  	# Note: 1 
pred.glin <- predict(glinmodel, newdata=test)

cor(pred.lin, test$DBWT)^2           	# Note: 2 
# [1] 0.09656043
cor(pred.glin, test$DBWT)^2
# [1] 0.1160727

# Note 1: 
#   Run both the linear model and the GAM on the test data 

# Note 2: 
#   Calculate R-squared for both models 
