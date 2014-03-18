# example 6.24 of section 6.3.4 
# (example 6.24 of section 6.3.4)  : Memorization methods : Building models using many variables : Using Naive Bayes 
# Title: Using a Naive Bayes package 

library('e1071')
lVars <- c(catVars,numericVars)
ff <- paste('as.factor(',outcome,'>0) ~ ',
   paste(lVars,collapse=' + '),sep='')
nbmodel <- naiveBayes(as.formula(ff),data=dTrain)
dTrain$nbpred <- predict(nbmodel,newdata=dTrain,type='raw')[,'TRUE']
dCal$nbpred <- predict(nbmodel,newdata=dCal,type='raw')[,'TRUE']
dTest$nbpred <- predict(nbmodel,newdata=dTest,type='raw')[,'TRUE']
calcAUC(dTrain$nbpred,dTrain[,outcome])
## [1] 0.4643591
calcAUC(dCal$nbpred,dCal[,outcome])
## [1] 0.5544484
calcAUC(dTest$nbpred,dTest[,outcome])
## [1] 0.5679519

