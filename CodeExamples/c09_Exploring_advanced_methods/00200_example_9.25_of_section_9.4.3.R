# example 9.25 of section 9.4.3 
# (example 9.25 of section 9.4.3)  : Exploring advanced methods : Using SVMs to model complicated decision boundaries : Using SVMs on real data 
# Title: Applying an SVM to the Spambase example 

library('kernlab')
spamFormulaV <- as.formula(paste('spam',
   paste(spamVars,collapse=' + '),sep=' ~ '))
svmM <- ksvm(spamFormulaV,data=spamTrain, 	# Note: 1 
        kernel='rbfdot', 	# Note: 2 
        C=10, 	# Note: 3 
        prob.model=T,cross=5, 	# Note: 4 
        class.weights=c('spam'=1,'non-spam'=10) 	# Note: 5 
        )
spamTest$svmPred <- predict(svmM,newdata=spamTest,type='response')
print(with(spamTest,table(y=spam,svmPred=svmPred)))
##           svmPred
## y          non-spam spam
##   non-spam      269    9
##   spam           27  153

# Note 1: 
#   Build a support vector model for the Spambase 
#   problem. 

# Note 2: 
#   Ask for the radial dot or Gaussian kernel (in 
#   fact the default kernel). 

# Note 3: 
#   Set the “soft margin penalty” high; prefer not moving training examples over getting a wider 
#   margin. Prefer a complex model that applies weakly to all the data 
#   over a simpler model that applies strongly on a subset of the 
#   data. 

# Note 4: 
#   Ask that, in addition to a predictive model, an estimate of a model estimating class 
#   probabilities also be built. Not all SVM libraries support this 
#   operation, and the probabilities are essentially built after the 
#   model (through a cross-validation procedure) and may not be as high-quality 
#   as the model itself. 

# Note 5: 
#   Explicitly control the trade-off between 
#   false positive and false negative errors. In this case, we say non-spam 
#   classified as spam (a false positive) should be considered an expensive 
#   mistake. 

