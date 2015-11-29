# example 9.3 of section 9.1.2 
# (example 9.3 of section 9.1.2)  : Exploring advanced methods : Using bagging and random forests to reduce training variance : Using random forests to further improve prediction 
# Title: Using random forests 

library(randomForest)           	# Note: 1 
set.seed(5123512) 	# Note: 2 
fmodel <- randomForest(x=spamTrain[,spamVars], 	# Note: 3 
        y=spamTrain$spam,
        ntree=100, 	# Note: 4 
        nodesize=7, 	# Note: 5 
        importance=T) 	# Note: 6 
accuracyMeasures(predict(fmodel, 	# Note: 7 
   newdata=spamTrain[,spamVars],type='prob')[,'spam'],
   spamTrain$spam=="spam",name="random forest, train")
##                  model  accuracy        f1  dev.norm
## 1 random forest, train 0.9884142 0.9706611 0.1428786
accuracyMeasures(predict(fmodel,
   newdata=spamTest[,spamVars],type='prob')[,'spam'],
   spamTest$spam=="spam",name="random forest, test")
##                 model  accuracy        f1  dev.norm
## 1 random forest, test 0.9541485 0.8845029 0.3972416

# Note 1: 
#   Load the randomForest package. 

# Note 2: 
#   Set the pseudo-random seed to a known value to try 
#   and make the random forest run repeatable. 

# Note 3: 
#   Call the randomForest() function to build the model 
#   with explanatory variables as x and the category to be predicted as 
#   y. 

# Note 4: 
#   Use 100 trees to be compatible with our bagging 
#   example. The default is 500 trees. 

# Note 5: 
#   Specify that each node of a tree must have a minimum 
#   of 7 elements, to be compatible with the default minimum node size that rpart() 
#   uses on this training set. 

# Note 6: 
#   Tell the algorithm to save information to be used for 
#   calculating variable importance (we’ll see this later). 

# Note 7: 
#   Report the model quality. 

