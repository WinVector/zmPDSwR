
# naive application of gbm to KDD2009 problem 
# haven't set hyper-parameters to useful values

load('KDD2009.Rdata')
library('gbm')
library('ROCR')

gmodel <- gbm(as.formula(f),interaction.depth=5,dist='bernoulli',
   data=dTrain)
calcAUC(predict(gmodel,n.trees=100,newdata=dTrain,type='response'),
   dTrain[,outcome])
## [1] 0.7025148
calcAUC(predict(gmodel,n.trees=100,newdata=dCal,type='response'),
   dCal[,outcome])
## [1] 0.6803138
calcAUC(predict(gmodel,n.trees=100,newdata=dTest,type='response'),
   dTest[,outcome])
## [1] 0.7095189

