# example:2_5.2.3 
# example:2 : Choosing and evaluating models : Evaluating models : Evaluating probability models 
# Title: 
                                        Plotting the receiver operating characteristic curve 


                                        Plotting the receiver operating characteristic curve
                                        library('ROCR')
eval <- prediction(spamTest$pred,spamTest$spam)
plot(performance(eval,"tpr","fpr"))
print(attributes(performance(eval,'auc'))$y.values[[1]])
[1] 0.9660072

