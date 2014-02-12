# example:1_7.2.1 
# example:1 : Linear and logistic regression : Using logistic regression : Understanding logistic regression 
# Title: 
                                Loading the CDC data 


                                Loading the CDC data
                                load("NatalRiskData.rData")
train <- sdata[sdata$ORIGRANDGROUP<=5,]
test <- sdata[sdata$ORIGRANDGROUP>5,]

