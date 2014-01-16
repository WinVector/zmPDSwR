# informalexample:2_6.2.2 
# informalexample:2 : Memorization methods : Building single-variable models : Using numeric features 
ggplot(data=dCal) +
   geom_density(aes(x=predVar126,color=as.factor(churn)))
