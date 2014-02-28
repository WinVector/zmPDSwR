# example 9.2 of section 9.1.1 
# (example 9.2 of section 9.1.1)  : Exploring advanced methods : Using bagging and random forests to reduce training variance : Using bagging to improve prediction 
# Title: Bagging decision trees 

ntrain <- dim(spamTrain)[1]
n <- ntrain                  	# Note: 1 
ntree <- 100

samples <- sapply(1:ntree,      	# Note: 2 
                 FUN = function(iter)
                   {sample(1:ntrain, size=n, replace=T)})

treelist <-lapply(1:ntree,       	# Note: 3 
                  FUN=function(iter)
                  {samp <- samples[,iter];
                   rpart(spamFormula, spamTrain[samp,])})

predict.bag <- function(treelist, newdata) {  	# Note: 4 
  preds <- sapply(1:length(treelist),
                 FUN=function(iter) {
                   predict(treelist[[iter]], newdata=newdata)})
  predsums <- rowSums(preds)
  predsums/length(treelist)
}

accuracyMeasures(predict.bag(treelist, newdata=spamTrain),  	# Note: 5 
                 spamTrain$spam=="spam",
                 name="bagging, training")


accuracyMeasures(predict.bag(treelist, newdata=spamTest),
                 spamTest$spam=="spam",
                 name="bagging, test")

# Note 1: 
#   Use bootstrap samples the same size as the training 
#   set, with 100 trees. 

# Note 2: 
#   Build the bootstrap samples by sampling the row indices of spamTrain with replacement. Each 
#   column of the matrix samples represents the row indices into spamTrain 
#   that comprise the bootstrap sample. 

# Note 3: 
#   Train the individual decision trees and return them 
#   in a list. Note: this step can take a few minutes. 

# Note 4: 
#   predict.bag assumes the underlying classifier returns decision probabilities, not 
#   decisions. 

# Note 5: 
#   Evaluate the bagged decision trees against the 
#   training and test sets. 

