# example 6.21 of section 6.3.3 
# (example 6.21 of section 6.3.3)  : Memorization methods : Building models using many variables : Using nearest neighbor methods 
# Title: Plotting the receiver operating characteristic curve 

plotROC <- function(predcol,outcol) {
   perf <- performance(prediction(predcol,outcol==pos),'tpr','fpr')
   pf <- data.frame(
      FalsePositiveRate=perf@x.values[[1]],
      TruePositiveRate=perf@y.values[[1]])
   ggplot() +
      geom_line(data=pf,aes(x=FalsePositiveRate,y=TruePositiveRate)) +
      geom_line(aes(x=c(0,1),y=c(0,1)))
}
print(plotROC(knnPred(dTest[,selVars]),dTest[,outcome]))

