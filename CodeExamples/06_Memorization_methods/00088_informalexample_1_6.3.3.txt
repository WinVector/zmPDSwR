# informalexample:1_6.3.3 
# informalexample:1 : Memorization methods : Building models using many variables : Using nearest neighbor methods 
dCal$kpred <- knnPred(dCal[,selVars])
ggplot(data=dCal) +
   geom_density(aes(x=kpred,
      color=as.factor(churn),linetype=as.factor(churn)))
