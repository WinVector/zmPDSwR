# informalexample:2_7.2.1 
# informalexample:2 : Linear and logistic regression : Using logistic regression : Understanding logistic regression 
load("NatalRiskData.rData")
train <- sdata[sdata$ORIGRANDGROUP<=5,]
test <- sdata[sdata$ORIGRANDGROUP>5,]
