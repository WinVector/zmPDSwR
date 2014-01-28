# example:1_6.3.4 
# example:1 : Memorization methods : Building models using many variables : Using Naive Bayes 
nPos <- sum(dTrain[,outcome]==pos)
pPos <- nPos/length(dTrain[,outcome])
nBayes <- function(pf) {  	# Note: 1 
   eps <- 1.0e-5
   lpc <- rowSums(log(pf/pPos + eps)) 	# Note: 2 
   lpo <- rowSums(log((1-pf)/(1-pPos) + eps)) 	# Note: 3 
   m <- pmax(lpc,lpo)
   pc <- pPos*exp(lpc - m)
   po <- (1-pPos)*exp(lpo - m) 	# Note: 4 
   pc/(pc+po) 	# Note: 5 
}

pVars <- paste('pred',c(numericVars,catVars),sep='')
dTrain$nbpredl <- nBayes(dTrain[,pVars])
dCal$nbpredl <- nBayes(dCal[,pVars])
dTest$nbpredl <- nBayes(dTest[,pVars]) 	# Note: 6 
print(calcAUC(dTrain$nbpredl,dTrain[,outcome]))
[1] 0.9757348
print(calcAUC(dCal$nbpredl,dCal[,outcome]))
[1] 0.5995206
print(calcAUC(dTest$nbpredl,dTest[,outcome]))
[1] 0.5956515 	# Note: 7 

# Note 1: 
#   Define a function that performs the Naive Bayes 
#   prediction 

# Note 2: 
#   For each row: compute (with a smoothing 
#   term) the sum of log(P[positive & 
#   evidence_i]/P[positive]) across all columns. This is 
#   equivalent to the log of the product of P[evidence_i 
#   | positive] up to terms that don’t depend on the 
#   positive/negative outcome. 

# Note 3: 
#   For each row: compute (with a smoothing 
#   term) the sum of log(P[negative & 
#   evidence_i]/P[negative]) across all columns. This is 
#   equivalent to the log of the product of P[evidence_i 
#   | negative] up to terms that don’t depend on the 
#   positive/negative outcome. 

# Note 4: 
#   Shift sums down and exponentiate to compute the 
#   Z*P[positive]*product_i P[evidence_i | positive] and Z*P[negative]* product_i 
#   P[evidence_i | negative] without numeric overflows where Z is some unknown 
#   constant of proportionality.  

# Note 5: 
#   Use the fact that the predicted positive probability 
#   plus the predicted negative probability should sum to one to find and eliminate 
#   Z. Return the correctly scaled predicted odds of being positive as our forecast.  

# Note 6: 
#   Apply the function to make the predictions.  

# Note 7: 
#   Calculate the AUCs. Notice the 
#   overfitting—fantastic performance on the training 
#   set that isn’t repeated on the calibration or test 
#   sets.  
