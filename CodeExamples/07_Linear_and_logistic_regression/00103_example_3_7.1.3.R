# example:3_7.1.3 
# example:3 : Linear and logistic regression : Using linear regression : Making predictions 
# Title: Computing R-squared 

rsq <- function(y,f) { 1 - sum((y-f)^2)/sum((y-mean(y))^2) }
rsq(log(dtrain$PINCP,base=10),predict(model,newdata=dtrain))
rsq(log(dtest$PINCP,base=10),predict(model,newdata=dtest))

