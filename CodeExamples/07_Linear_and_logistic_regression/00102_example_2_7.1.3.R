# example:2_7.1.3 
# example:2 : Linear and logistic regression : Using linear regression : Making predictions 
# Title: 
                                        Plotting residuals income as a function of predicted log income 


                                        Plotting residuals income as a function of predicted log income
                                        ggplot(data=dtest,aes(x=predLogPINCP,
                     y=predLogPINCP-log(PINCP,base=10))) +
  geom_point(alpha=0.2,color="black") +
  geom_smooth(aes(x=predLogPINCP,
                  y=predLogPINCP-log(PINCP,base=10)),
                  color="black")

