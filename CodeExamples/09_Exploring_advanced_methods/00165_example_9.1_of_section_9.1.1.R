# example 9.1 of section 9.1.1 
# (example 9.1 of section 9.1.1)  : Exploring advanced methods : Using bagging and random forests to reduce training variance : Using bagging to improve prediction 
# Title: Preparing Spambase data and evaluating the performance of decision trees 

spamD <- read.table('spamD.tsv',header=T,sep='\t')  	# Note: 1 
spamTrain <- subset(spamD,spamD$rgroup>=10)
spamTest <- subset(spamD,spamD$rgroup<10)

spamVars <- setdiff(colnames(spamD),list('rgroup','spam'))
spamFormula <- as.formula(paste('spam=="spam"',   	# Note: 2 
                          paste(spamVars,collapse=' + '),sep=' ~ '))

loglikelihood <- function(y, py) {   	# Note: 3 
  pysmooth <- ifelse(py==0, 1e-12,
                  ifelse(py==1, 1-1e-12, py))

  sum(y * log(pysmooth) + (1-y)*log(1 - pysmooth))
}


accuracyMeasures <- function(pred, truth, name="model") {  	# Note: 4 
  dev.norm <- -2*loglikelihood(as.numeric(truth), pred)/length(pred)  	# Note: 5 
  ctable <- table(truth=truth,
                 pred=(pred>0.5))                                    	# Note: 6 
  accuracy <- sum(diag(ctable))/sum(ctable)
  precision <- ctable[2,2]/sum(ctable[,2])
  recall <- ctable[2,2]/sum(ctable[2,])
  f1 <- precision*recall
  data.frame(model=name, accuracy=accuracy, f1=f1, dev.norm)
}


library(rpart)                                                  	# Note: 7 
treemodel <- rpart(spamFormula, spamTrain)

accuracyMeasures(predict(treemodel, newdata=spamTrain),  	# Note: 8 
                 spamTrain$spam=="spam",
                 name="tree, training")


accuracyMeasures(predict(treemodel, newdata=spamTest),
                 spamTest$spam=="spam",
                 name="tree, test")

# Note 1: 
#   Load the data and split into training (90% of data) 
#   and test (10% of data) sets. 

# Note 2: 
#   Use all the features and do binary classification, 
#   where TRUE corresponds to spam documents. 

# Note 3: 
#   A function to calculate log likelihood (for 
#   calculating deviance). 

# Note 4: 
#   A function to calculate and return various measures 
#   on the model: normalized deviance, prediction accuracy, and f1, which is the 
#   product of precision and recall. 

# Note 5: 
#   Normalize the deviance by the number of data points 
#   so that we can compare the deviance across training and test 
#   sets. 

# Note 6: 
#   Convert the class probability estimator into a 
#   classifier by labeling documents that score greater than 0.5 as 
#   spam. 

# Note 7: 
#   Load the rpart library and fit a decision tree 
#   model. 

# Note 8: 
#   Evaluate the decision tree model against the 
#   training and test sets. 

