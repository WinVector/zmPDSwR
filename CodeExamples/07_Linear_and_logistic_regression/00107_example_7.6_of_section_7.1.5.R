# example 7.6 of section 7.1.5 
# (example 7.6 of section 7.1.5)  : Linear and logistic regression : Using linear regression : Reading the model summary and characterizing coefficient quality 
# Title: Summarizing residuals 

> summary(log(dtrain$PINCP,base=10) - predict(model,newdata=dtrain))
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
-1.29200 -0.14150  0.02458  0.00000  0.17630  0.62530
> summary(log(dtest$PINCP,base=10) - predict(model,newdata=dtest))
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max.
-1.494000 -0.165300  0.018920 -0.004637  0.175500  0.868100

