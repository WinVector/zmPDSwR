# example:1_9.1.2 
# example:1 : Exploring advanced methods : Using bagging and random forests to reduce training variance : Using random forests to further improve prediction 
library(randomForest)           	# Note: 1 

fmodel <- randomForest(spamFormula,    	# Note: 2 
                          data=spamTrain,
                          ntree=100,      	# Note: 3 
                          nodesize=7,     	# Note: 4 
                          importance=T)   	# Note: 5 

# Note 1: 
#   Load the randomForest package. 

# Note 2: 
#   Call the randomForest() function to build the model. 

# Note 3: 
#   Use 100 trees to be compatible with our bagging 
#   example. The default is 500 trees. 

# Note 4: 
#   Specify that each node of a tree must have a minimum 
#   of 7 elements, to be compatible with the default minimum node size that 
#   rpart() uses on this training set. 

# Note 5: 
#   Tell the algorithm to save information to be used for calculating variable importance (we’ll 
#   see this later). 
