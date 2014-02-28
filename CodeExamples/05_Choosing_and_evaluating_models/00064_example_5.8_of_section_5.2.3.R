# example 5.8 of section 5.2.3 
# (example 5.8 of section 5.2.3)  : Choosing and evaluating models : Evaluating models : Evaluating probability models 
# Title: Calculating log likelihood 

> sum(ifelse(spamTest$spam=='spam',
   log(spamTest$pred),
   log(1-spamTest$pred)))
[1] -134.9478
> sum(ifelse(spamTest$spam=='spam',
   log(spamTest$pred),
   log(1-spamTest$pred)))/dim(spamTest)[[1]]
[1] -0.2946458

