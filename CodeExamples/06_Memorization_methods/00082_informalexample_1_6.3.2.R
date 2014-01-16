# informalexample:1_6.3.2 
# informalexample:1 : Memorization methods : Building models using many variables : Using decision trees 
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
