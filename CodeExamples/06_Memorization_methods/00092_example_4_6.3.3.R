# example:4_6.3.3 
# example:4 : Memorization methods : Building models using many variables : Using nearest neighbor methods 
# Title: Plotting the performance of a logistic regression model 

> gmodel <- glm(as.formula(f),data=dTrain,family=binomial(link='logit'))
> print(calcAUC(predict(gmodel,newdata=dTrain),dTrain[,outcome]))
[1] 0.7309537
> print(calcAUC(predict(gmodel,newdata=dTest),dTest[,outcome]))
[1] 0.7234645
> print(calcAUC(predict(gmodel,newdata=dCal),dCal[,outcome]))
[1] 0.7170824

