# example:2_6.3.4 
# example:2 : Memorization methods : Building models using many variables : Using Naive Bayes 
> library('e1071')
> ff <- paste('as.factor(',outcome,'>0) ~ ',
   paste(lVars,collapse=' + '),sep='')
> nbmodel <- naiveBayes(as.formula(ff),data=dTrain)
> dTrain$nbpred <- predict(nbmodel,newdata=dTrain,type='raw')[,'TRUE']
> dCal$nbpred <- predict(nbmodel,newdata=dCal,type='raw')[,'TRUE']
> dTest$nbpred <- predict(nbmodel,newdata=dTest,type='raw')[,'TRUE']
> calcAUC(dTrain$nbpred,dTrain[,outcome])
[1] 0.8200033
> calcAUC(dCal$nbpred,dCal[,outcome])
[1] 0.5484643
> calcAUC(dTest$nbpred,dTest[,outcome])
[1] 0.5462362
