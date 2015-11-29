# example 6.15 of section 6.3.2 
# (example 6.15 of section 6.3.2)  : Memorization methods : Building models using many variables : Using decision trees 
# Title: Building yet another bad decision tree 

> tmodel <- rpart(fV2,data=dTrain,
   control=rpart.control(cp=0.001,minsplit=1000,
      minbucket=1000,maxdepth=5)
 )
> print(calcAUC(predict(tmodel,newdata=dTrain),dTrain[,outcome]))
[1] 0.9421195
> print(calcAUC(predict(tmodel,newdata=dTest),dTest[,outcome]))
[1] 0.5794633
> print(calcAUC(predict(tmodel,newdata=dCal),dCal[,outcome]))
[1] 0.547967

