
# naive application of gbm to KDD2009 problem 
# haven't set hyper-parameters to useful values

load('KDD2009.Rdata')
library('gbm')
library('ROCR')
gmodel <- gbm(as.formula(f),data=dTrain)
calcAUC(predict(gmodel,n.trees=100,newdata=dTrain),dTrain[,outcome])
## [1] 0.6327771
calcAUC(predict(gmodel,n.trees=100,newdata=dTest),dTest[,outcome])
## [1] 0.645889
calcAUC(predict(gmodel,n.trees=100,newdata=dCal),dCal[,outcome])
## [1] 0.6246506
