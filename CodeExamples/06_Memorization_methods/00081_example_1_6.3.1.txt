# example:1_6.3.1 
# example:1 : Memorization methods : Building models using many variables : Variable selection 
entropy <- function(x) {
  xpos <- x[x>0 & !is.na(x)]
  scaled <- xpos/sum(xpos)
  sum(-scaled*log(scaled,2))
}

logLikelyhood <- function(outCol,predCol) {
  sum(ifelse(outCol==pos,log(predCol),log(1-predCol)))
}

selVars <- c()
minStep <- 5
baseRateTrain <- logLikelyhood(dTrain[,outcome],
   sum(dTrain[,outcome]==pos)/length(dTrain[,outcome]))
baseRateCheck <- logLikelyhood(dCal[,outcome],
   sum(dCal[,outcome]==pos)/length(dCal[,outcome]))
for(v in catVars) {
  pi <- paste('pred',v,sep='')
  liCheck <- 2*((logLikelyhood(dCal[,outcome],dCal[,pi]) -
      baseRateCheck) -
      2^entropy(table(dCal[,pi],useNA='ifany')))
  if(liCheck>minStep) {
     print(sprintf("%s, calibrationScore: %g",
        pi,liCheck))
     selVars <- c(selVars,pi)
  }
}
for(v in numericVars) {
  pi <- paste('pred',v,sep='')
  liCheck <- 2*((logLikelyhood(dCal[,outcome],dCal[,pi]) -
      baseRateCheck) - 1)
  if(liCheck>=minStep) {
     print(sprintf("%s, calibrationScore: %g",
        pi,liCheck))
     selVars <- c(selVars,pi)
  }
}
