# example 6.4 of section 6.2.1 
# (example 6.4 of section 6.2.1)  : Memorization methods : Building single-variable models : Using categorical features 
# Title: Function to build single-variable models for categorical variables 

mkPredC <- function(outCol,varCol,appCol) { 	# Note: 1 
   pPos <- sum(outCol==pos)/length(outCol) 	# Note: 2 
   naTab <- table(as.factor(outCol[is.na(varCol)]))
   pPosWna <- (naTab/sum(naTab))[pos] 	# Note: 3 
   vTab <- table(as.factor(outCol),varCol)
   pPosWv <- (vTab[pos,]+1.0e-3*pPos)/(colSums(vTab)+1.0e-3) 	# Note: 4 
   pred <- pPosWv[appCol] 	# Note: 5 
   pred[is.na(appCol)] <- pPosWna 	# Note: 6 
   pred[is.na(pred)] <- pPos 	# Note: 7 
   pred 	# Note: 8 
}

# Note 1: 
#   Given a vector of training outcomes (outCol), 
#   a categorical training variable (varCol), and a 
#   prediction variable (appCol), use outCol and 
#   varCol to build a single-variable model and then 
#   apply the model to appCol to get new 
#   predictions. 

# Note 2: 
#   Get stats on how often outcome is positive 
#   during training. 

# Note 3: 
#   Get stats on how often outcome is positive for 
#   NA values of variable during training. 

# Note 4: 
#   Get stats on how often outcome is positive, 
#   conditioned on levels of training variable. 

# Note 5: 
#   Make predictions by looking up levels of 
#   appCol. 

# Note 6: 
#   Add in predictions for NA levels of 
#   appCol. 

# Note 7: 
#   Add in predictions for levels of appCol that 
#   weren’t known during training. 

# Note 8: 
#   Return vector of predictions. 

