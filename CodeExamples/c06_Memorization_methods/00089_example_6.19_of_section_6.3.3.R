# example 6.19 of section 6.3.3 
# (example 6.19 of section 6.3.3)  : Memorization methods : Building models using many variables : Using nearest neighbor methods 
# Title: Running k-nearest neighbors 

> library('class')
> nK <- 200
> knnTrain <- dTrain[,selVars]  	# Note: 1 
> knnCl <- dTrain[,outcome]==pos 	# Note: 2 
> knnPred <- function(df) { 	# Note: 3 
    knnDecision <- knn(knnTrain,df,knnCl,k=nK,prob=T)
    ifelse(knnDecision==TRUE, 	# Note: 4 
       attributes(knnDecision)$prob,
       1-(attributes(knnDecision)$prob))
}
> print(calcAUC(knnPred(dTrain[,selVars]),dTrain[,outcome]))
[1] 0.7443927
> print(calcAUC(knnPred(dCal[,selVars]),dCal[,outcome]))
[1] 0.7119394
> print(calcAUC(knnPred(dTest[,selVars]),dTest[,outcome]))
[1] 0.718256

# Note 1: 
#   Build a data frame with only the variables we 
#   wish to use for classification. 

# Note 2: 
#   Build a vector with the known training 
#   outcomes. 

# Note 3: 
#   Bind the knn() training function with our data 
#   in a new function. 

# Note 4: 
#   Convert knn’s unfortunate convention of 
#   calculating probability as “proportion of the 
#   votes for the winning class” into the more useful 
#   “calculated probability of being a positive 
#   example.” 

