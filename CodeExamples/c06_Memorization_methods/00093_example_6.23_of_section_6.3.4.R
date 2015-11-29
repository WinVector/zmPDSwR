# example 6.23 of section 6.3.4 
# (example 6.23 of section 6.3.4)  : Memorization methods : Building models using many variables : Using Naive Bayes 
# Title: Building, applying, and evaluating a Naive Bayes model 

pPos <- sum(dTrain[,outcome]==pos)/length(dTrain[,outcome])
nBayes <- function(pPos,pf) { 	# Note: 1 
   pNeg <- 1 - pPos
   smoothingEpsilon <- 1.0e-5
   scorePos <- log(pPos + smoothingEpsilon) + 
      rowSums(log(pf/pPos + smoothingEpsilon)) 	# Note: 2 
   scoreNeg <- log(pNeg + smoothingEpsilon) +
      rowSums(log((1-pf)/(1-pPos) + smoothingEpsilon)) 	# Note: 3 
   m <- pmax(scorePos,scoreNeg)
   expScorePos <- exp(scorePos-m)
   expScoreNeg <- exp(scoreNeg-m) 	# Note: 4 
   expScorePos/(expScorePos+expScoreNeg) 	# Note: 5 
}
pVars <- paste('pred',c(numericVars,catVars),sep='')
dTrain$nbpredl <- nBayes(pPos,dTrain[,pVars])
dCal$nbpredl <- nBayes(pPos,dCal[,pVars])
dTest$nbpredl <- nBayes(pPos,dTest[,pVars]) 	# Note: 6 
print(calcAUC(dTrain$nbpredl,dTrain[,outcome]))
## [1] 0.9757348
print(calcAUC(dCal$nbpredl,dCal[,outcome]))
## [1] 0.5995206
print(calcAUC(dTest$nbpredl,dTest[,outcome]))
## [1] 0.5956515 	# Note: 7

# Note 1: 
#   Define a function that performs the Naive 
#   Bayes prediction. 

# Note 2: 
#   For each row, compute (with a smoothing term) 
#   the sum of log(P[positive & 
#   evidence_i]/P[positive]) across all columns. This 
#   is equivalent to the log of the product of 
#   P[evidence_i | positive] up to terms that don’t 
#   depend on the positive/negative outcome. 

# Note 3: 
#   For each row, compute (with a smoothing term) 
#   the sum of log(P[negative & 
#   evidence_i]/P[negative]) across all columns. This 
#   is equivalent to the log of the product of 
#   P[evidence_i | negative] up to terms that don’t 
#   depend on the positive/negative outcome. 

# Note 4: 
#   Exponentiate to turn sums back into products, 
#   but make sure we don’t cause a floating point 
#   overflow in doing so. 

# Note 5: 
#   Use the fact that the predicted positive 
#   probability plus the predicted negative 
#   probability should sum to 1.0 to find and 
#   eliminate Z. Return the correctly scaled predicted 
#   odds of being positive as our forecast. 

# Note 6: 
#   Apply the function to make the predictions. 

# Note 7: 
#   Calculate the AUCs. Notice the 
#   overfit—fantastic performance on the training 
#   set that isn’t repeated on the calibration or test 
#   sets. 

