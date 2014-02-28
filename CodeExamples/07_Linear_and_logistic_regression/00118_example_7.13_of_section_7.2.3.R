# example 7.13 of section 7.2.3 
# (example 7.13 of section 7.2.3)  : Linear and logistic regression : Using logistic regression : Making predictions 
# Title: Evaluating our chosen model 

> ctab.test <- table(pred=test$pred>0.02, atRisk=test$atRisk) 	# Note: 1 
> ctab.test                                                      	# Note: 2 
       atRisk
pred    FALSE TRUE
  FALSE  9487   93
  TRUE   2405  116
> precision <- ctab.test[2,2]/sum(ctab.test[2,])
> precision
[1] 0.04601349
> recall <- ctab.test[2,2]/sum(ctab.test[,2])
> recall
[1] 0.5550239
> enrich <- precision/mean(as.numeric(test$atRisk))
> enrich
[1] 2.664159

# Note 1: 
#   Build confusion matrix. 

# Note 2: 
#   Rows contain predicted negatives and 
#   positives; columns contain actual negatives and 
#   positives. 

