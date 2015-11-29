# example 6.7 of section 6.2.2 
# (example 6.7 of section 6.2.2)  : Memorization methods : Building single-variable models : Using numeric features 
# Title: Scoring numeric variables by AUC 

> mkPredN <- function(outCol,varCol,appCol) {
   cuts <- unique(as.numeric(quantile(varCol,
      probs=seq(0, 1, 0.1),na.rm=T)))
   varC <- cut(varCol,cuts)
   appC <- cut(appCol,cuts)
   mkPredC(outCol,varC,appC)
}
> for(v in numericVars) {
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
[1] "predVar6, trainAUC: 0.557 calibrationAUC: 0.554"
[1] "predVar7, trainAUC: 0.555 calibrationAUC: 0.565"
[1] "predVar13, trainAUC: 0.568 calibrationAUC: 0.553"
[1] "predVar73, trainAUC: 0.608 calibrationAUC: 0.616"
[1] "predVar74, trainAUC: 0.574 calibrationAUC: 0.566"
[1] "predVar81, trainAUC: 0.558 calibrationAUC: 0.542"
[1] "predVar113, trainAUC: 0.557 calibrationAUC: 0.567"
[1] "predVar126, trainAUC: 0.635 calibrationAUC: 0.629"
[1] "predVar140, trainAUC: 0.561 calibrationAUC: 0.560"
[1] "predVar189, trainAUC: 0.574 calibrationAUC: 0.599"

