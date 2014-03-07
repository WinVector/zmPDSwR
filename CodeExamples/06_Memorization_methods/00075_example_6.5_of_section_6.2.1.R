# example 6.5 of section 6.2.1 
# (example 6.5 of section 6.2.1)  : Memorization methods : Building single-variable models : Using categorical features 
# Title: Applying single-categorical variable models to all of our datasets 

for(v in catVars) {
  pi <- paste('pred',v,sep='')
  dTrain[,pi] <- mkPredC(dTrain[,outcome],dTrain[,v],dTrain[,v])
  dCal[,pi] <- mkPredC(dTrain[,outcome],dTrain[,v],dCal[,v])
  dTest[,pi] <- mkPredC(dTrain[,outcome],dTrain[,v],dTest[,v])
}

