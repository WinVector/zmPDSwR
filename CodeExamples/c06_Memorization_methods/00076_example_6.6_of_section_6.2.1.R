# example 6.6 of section 6.2.1 
# (example 6.6 of section 6.2.1)  : Memorization methods : Building single-variable models : Using categorical features 
# Title: Scoring categorical variables by AUC 

library('ROCR')

calcAUC <- function(predcol,outcol) {
  perf <- performance(prediction(predcol,outcol==pos),'auc')
  as.numeric(perf@y.values)
}

for(v in catVars) {
  pi <- paste('pred',v,sep='')
  aucTrain <- calcAUC(dTrain[,pi],dTrain[,outcome])
  if(aucTrain>=0.8) {
     aucCal <- calcAUC(dCal[,pi],dCal[,outcome])
     print(sprintf("%s, trainAUC: %4.3f calibrationAUC: %4.3f",
       pi,aucTrain,aucCal))
  }
}
