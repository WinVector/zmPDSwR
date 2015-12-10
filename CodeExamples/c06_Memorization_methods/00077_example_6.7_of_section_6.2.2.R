# example 6.7 of section 6.2.2 
# (example 6.7 of section 6.2.2)  : Memorization methods : Building single-variable models : Using numeric features 
# Title: Scoring numeric variables by AUC 

mkPredN <- function(outCol,varCol,appCol) {
  cuts <- unique(as.numeric(quantile(varCol,
     probs=seq(0, 1, 0.1),na.rm=T)))
  varC <- cut(varCol,cuts)
  appC <- cut(appCol,cuts)
  mkPredC(outCol,varC,appC)
}
for(v in numericVars) {
  pi <- paste('pred',v,sep='')
  dTrain[,pi] <- mkPredN(dTrain[,outcome],dTrain[,v],dTrain[,v])
  dTest[,pi] <- mkPredN(dTrain[,outcome],dTrain[,v],dTest[,v])
  dCal[,pi] <- mkPredN(dTrain[,outcome],dTrain[,v],dCal[,v])
  aucTrain <- calcAUC(dTrain[,pi],dTrain[,outcome])
  if(aucTrain>=0.55) {
     aucCal <- calcAUC(dCal[,pi],dCal[,outcome])
     print(sprintf("%s, trainAUC: %4.3f calibrationAUC: %4.3f",
      pi,aucTrain,aucCal))
  }
}
