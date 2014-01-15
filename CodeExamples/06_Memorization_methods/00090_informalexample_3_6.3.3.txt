# informalexample:3_6.3.3 
# informalexample:3 : Memorization methods : Building models using many variables : Using nearest neighbor methods 
> gmodel <- glm(as.formula(f),data=dTrain,family=binomial(link='logit'))
> print(calcAUC(predict(gmodel,newdata=dTrain),dTrain[,outcome]))
[1] 0.7309537
> print(calcAUC(predict(gmodel,newdata=dTest),dTest[,outcome]))
[1] 0.7234645
> print(calcAUC(predict(gmodel,newdata=dCal),dCal[,outcome]))
[1] 0.7170824
