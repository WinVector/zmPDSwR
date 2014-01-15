# informalexample:1_5.2.3 
# informalexample:1 : Choosing and evaluating models : Evaluating models : Evaluating probability models 
ggplot(data=spamTest) +
   geom_density(aes(x=pred,color=spam,linetype=spam))
