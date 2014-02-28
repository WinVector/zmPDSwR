# example 5.6 of section 5.2.3 
# (example 5.6 of section 5.2.3)  : Choosing and evaluating models : Evaluating models : Evaluating probability models 
# Title: Making a double density plot 

ggplot(data=spamTest) +
   geom_density(aes(x=pred,color=spam,linetype=spam))

