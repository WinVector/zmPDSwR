# informalexample:3_9.1.2 
# informalexample:3 : Exploring advanced methods : Using bagging and random forests to reduce training variance : Using random forests to further improve prediction 
ordered <- sort(varImp[,1], decreasing=T)   	# Note: 1 

spamFormula2 <- as.formula(paste('spam=="spam"',  	# Note: 2 
                                paste(names(ordered[1:25]),
                                            collapse=' + '),
                                             sep=' ~ '))

fmodel_small <- randomForest(spamFormula2,data=spamTrain,
                             ntree=100,
                             nodesize=7)

# Note 1: 
#   Sort the variables by their importance, as measured by MSE 

# Note 2: 
#   Build a random forest model using only the 25 most important variables 
