# example:3_5.2.1 
# example:3 : Choosing and evaluating models : Evaluating models : Evaluating classification models 
# Title: 
                                        Spam confusion matrix 


                                        Spam confusion matrix
                                        > cM <- table(truth=spamTest$spam,prediction=spamTest$pred>0.5)
> print(cM)
         prediction
truth      FALSE TRUE
  non-spam   264   14
  spam        22  158

