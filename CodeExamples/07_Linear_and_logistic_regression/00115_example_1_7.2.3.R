# example:1_7.2.3 
# example:1 : Linear and logistic regression : Using logistic regression : Making predictions 
# Title: Applying the logistic regression model 

train$pred <- predict(model, newdata=train, type="response")
test$pred <- predict(model, newdata=test, type="response")

