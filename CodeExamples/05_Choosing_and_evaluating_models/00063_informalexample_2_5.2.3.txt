# informalexample:2_5.2.3 
# informalexample:2 : Choosing and evaluating models : Evaluating models : Evaluating probability models 
library('ROCR')
eval <- prediction(spamTest$pred,spamTest$spam)
plot(performance(eval,"tpr","fpr"))
print(attributes(performance(eval,'auc'))$y.values[[1]])
[1] 0.9660072
