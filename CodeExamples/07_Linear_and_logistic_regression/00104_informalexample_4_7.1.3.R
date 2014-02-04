# informalexample:4_7.1.3 
# informalexample:4 : Linear and logistic regression : Using linear regression : Making predictions 
rmse <- function(y, f) { sqrt(mean( (y-f)^2 )) }
rmse(log(dtrain$PINCP,base=10),predict(model,newdata=dtrain))
rmse(log(dtest$PINCP,base=10),predict(model,newdata=dtest))
