# example:4_5.2.3 
# example:4 : Choosing and evaluating models : Evaluating models : Evaluating probability models 
# Title: Computing the null model’s log likelihood 

> pNull <- sum(ifelse(spamTest$spam=='spam',1,0))/dim(spamTest)[[1]]
> sum(ifelse(spamTest$spam=='spam',1,0))*log(pNull) +
   sum(ifelse(spamTest$spam=='spam',0,1))*log(1-pNull)
[1] -306.8952

