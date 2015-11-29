# example 6.13 of section 6.3.2 
# (example 6.13 of section 6.3.2)  : Memorization methods : Building models using many variables : Using decision trees 
# Title: Building a bad decision tree 

> library('rpart')
> fV <- paste(outcome,'>0 ~ ',
   paste(c(catVars,numericVars),collapse=' + '),sep='')
> tmodel <- rpart(fV,data=dTrain)
> print(calcAUC(predict(tmodel,newdata=dTrain),dTrain[,outcome]))
[1] 0.9241265
> print(calcAUC(predict(tmodel,newdata=dTest),dTest[,outcome]))
[1] 0.5266172
> print(calcAUC(predict(tmodel,newdata=dCal),dCal[,outcome]))
[1] 0.5126917

