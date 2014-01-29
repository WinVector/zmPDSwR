# informalexample:1_7.2.3 
# informalexample:1 : Linear and logistic regression : Using logistic regression : Making predictions 
train$pred <- predict(model, newdata=train, type="response")
test$pred <- predict(model, newdata=test, type="response")
