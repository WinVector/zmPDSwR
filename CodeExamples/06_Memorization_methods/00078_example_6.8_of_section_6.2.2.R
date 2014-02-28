# example 6.8 of section 6.2.2 
# (example 6.8 of section 6.2.2)  : Memorization methods : Building single-variable models : Using numeric features 
# Title: Plotting variable performance 

ggplot(data=dCal) +
   geom_density(aes(x=predVar126,color=as.factor(churn)))

