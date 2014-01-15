# example:1_6.3.3 
# example:1 : Memorization methods : Building models using many variables : Using nearest neighbor methods 
> library('class')
> nK <- 200
> knnTrain <- dTrain[,selVars]
> knnCl <- dTrain[,outcome]==pos
> knnPred <- function(df) {
+    knnDecision <- knn(knnTrain,df,knnCl,k=nK,prob=T)
+    ifelse(knnDecision==TRUE,
+       attributes(knnDecision)$prob,
+       1-(attributes(knnDecision)$prob))
+ }
> print(calcAUC(knnPred(dTrain[,selVars]),dTrain[,outcome]))
[1] 0.7418755
> print(calcAUC(knnPred(dCal[,selVars]),dCal[,outcome]))
[1] 0.7205581
> print(calcAUC(knnPred(dTest[,selVars]),dTest[,outcome]))
[1] 0.7090571
