# example 9.5 of section 9.1.2 
# (example 9.5 of section 9.1.2)  : Exploring advanced methods : Using bagging and random forests to reduce training variance : Using random forests to further improve prediction 
# Title: Fitting with fewer variables 

selVars <- names(sort(varImp[,1], decreasing=T))[1:25] 	# Note: 1 

fsel <- randomForest(x=spamTrain[,selVars],y=spamTrain$spam, 	# Note: 2 
                           ntree=100,
                           nodesize=7,
                           importance=T)
                           
accuracyMeasures(predict(fsel,
   newdata=spamTrain[,selVars],type='prob')[,'spam'],
   spamTrain$spam=="spam",name="RF small, train")
##             model  accuracy        f1  dev.norm
## 1 RF small, train 0.9876901 0.9688546 0.1506817

accuracyMeasures(predict(fsel,
   newdata=spamTest[,selVars],type='prob')[,'spam'],
   spamTest$spam=="spam",name="RF small, test")
##            model  accuracy        f1 dev.norm
## 1 RF small, test 0.9497817 0.8738142 0.400825

# Note 1: 
#   Sort the variables by their importance, as 
#   measured by accuracy change. 

# Note 2: 
#   Build a random forest model using only the 25 
#   most important variables. 

