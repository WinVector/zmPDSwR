# example 6.14 of section 6.3.2 
# (example 6.14 of section 6.3.2)  : Memorization methods : Building models using many variables : Using decision trees 
# Title: Building another bad decision tree 

> tVars <- paste('pred',c(catVars,numericVars),sep='')
> fV2 <- paste(outcome,'>0 ~ ',paste(tVars,collapse=' + '),sep='')
> tmodel <- rpart(fV2,data=dTrain)
> print(calcAUC(predict(tmodel,newdata=dTrain),dTrain[,outcome]))
[1] 0.928669
> print(calcAUC(predict(tmodel,newdata=dTest),dTest[,outcome]))
[1] 0.5390648
> print(calcAUC(predict(tmodel,newdata=dCal),dCal[,outcome]))
[1] 0.5384152

