# informalexample:3_7.1.3 
# informalexample:3 : Linear and logistic regression : Using linear regression : Making predictions 
rsq <- function(y,f) { 1 - sum((y-f)^2)/sum((y-mean(y))^2) }
rsq(log(dtrain$PINCP,base=10),predict(model,newdata=dtrain))
rsq(log(dtest$PINCP,base=10),predict(model,newdata=dtest))
