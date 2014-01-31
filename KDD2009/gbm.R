
# naive application of gbm to KDD2009 problem 
# haven't set hyper-parameters to useful values

load('KDD2009.Rdata')
library('gbm')
library('ROCR')

gmodel <- gbm(as.formula(f),interaction.depth=5,dist='bernoulli',
   data=dTrain)
calcAUC(predict(gmodel,n.trees=100,newdata=dTrain),dTrain[,outcome])
## [1] 0.7008435
calcAUC(predict(gmodel,n.trees=100,newdata=dCal),dCal[,outcome])
## [1] 0.6793182
calcAUC(predict(gmodel,n.trees=100,newdata=dTest),dTest[,outcome])
## [1] 0.7064753
