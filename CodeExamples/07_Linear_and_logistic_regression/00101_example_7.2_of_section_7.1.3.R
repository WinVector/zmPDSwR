# example 7.2 of section 7.1.3 
# (example 7.2 of section 7.1.3)  : Linear and logistic regression : Using linear regression : Making predictions 
# Title: Plotting log income as a function of predicted log income 

ggplot(data=dtest,aes(x=predLogPINCP,y=log(PINCP,base=10))) +
   geom_point(alpha=0.2,color="black") +
   geom_smooth(aes(x=predLogPINCP,
      y=log(PINCP,base=10)),color="black") +
   geom_line(aes(x=log(PINCP,base=10),
      y=log(PINCP,base=10)),color="blue",linetype=2) +
   scale_x_continuous(limits=c(4,5)) +
   scale_y_continuous(limits=c(3.5,5.5))

