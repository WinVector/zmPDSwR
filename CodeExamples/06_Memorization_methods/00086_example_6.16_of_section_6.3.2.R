# example 6.16 of section 6.3.2 
# (example 6.16 of section 6.3.2)  : Memorization methods : Building models using many variables : Using decision trees 
# Title: Building a better decision tree 

f <- paste(outcome,'>0 ~ ',paste(selVars,collapse=' + '),sep='')
> tmodel <- rpart(f,data=dTrain,
   control=rpart.control(cp=0.001,minsplit=1000,
      minbucket=1000,maxdepth=5)
 )
> print(calcAUC(predict(tmodel,newdata=dTrain),dTrain[,outcome]))
[1] 0.6906852
> print(calcAUC(predict(tmodel,newdata=dTest),dTest[,outcome]))
[1] 0.6843595
> print(calcAUC(predict(tmodel,newdata=dCal),dCal[,outcome]))
[1] 0.6669301

