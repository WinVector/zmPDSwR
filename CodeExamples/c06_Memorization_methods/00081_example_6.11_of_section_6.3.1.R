# example 6.11 of section 6.3.1 
# (example 6.11 of section 6.3.1)  : Memorization methods : Building models using many variables : Variable selection 
# Title: Basic variable selection 

#    Each variable we use represents a chance of explaining
# more of the outcome variation (a chance of building a better
# model) but also represents a possible source of noise and
# overfitting. To control this effect, we often preselect
# which subset of variables we’ll use to fit. Variable
# selection can be an important defensive modeling step even
# for types of models that “don’t need it” (as seen with
# decision trees in section 6.3.2).  Listing 6.11 shows a
# hand-rolled variable selection loop where each variable is
# scored according to a deviance inspired score, where a
# variable is scored with a bonus proportional to the change
# in in scaled log likelihood of the training data.  We could
# also try an AIC (Akaike information criterion) by
# subtracting a penalty proportional to the complexity of the
# variable (which in this case is 2^entropy for categorical
# variables and a stand-in of 1 for numeric variables).  The
# score is a bit ad hoc, but tends to work well in selecting
# variables. Notice we’re using performance on the calibration
# set (not the training set) to pick variables. Note that we
# don’t use the test set for calibration; to do so lessens the
# reliability of the test set for model quality confirmation.

logLikelyhood <- function(outCol,predCol) { 	# Note: 1 
  sum(ifelse(outCol==pos,log(predCol),log(1-predCol)))
}

selVars <- c()
minStep <- 5
baseRateCheck <- logLikelyhood(dCal[,outcome],
   sum(dCal[,outcome]==pos)/length(dCal[,outcome]))

for(v in catVars) {  	# Note: 2 
  pi <- paste('pred',v,sep='')
  liCheck <- 2*((logLikelyhood(dCal[,outcome],dCal[,pi]) -
      baseRateCheck))
  if(liCheck>minStep) {
     print(sprintf("%s, calibrationScore: %g",
        pi,liCheck))
     selVars <- c(selVars,pi)
  }
}

for(v in numericVars) { 	# Note: 3 
  pi <- paste('pred',v,sep='')
  liCheck <- 2*((logLikelyhood(dCal[,outcome],dCal[,pi]) -
      baseRateCheck))
  if(liCheck>=minStep) {
     print(sprintf("%s, calibrationScore: %g",
        pi,liCheck))
     selVars <- c(selVars,pi)
  }
}

# Note 1: 
#   Define a convenience function to compute log 
#   likelihood. 

# Note 2: 
#   Run through categorical variables and pick 
#   based on a deviance improvement (related to 
#   difference in log likelihoods; see chapter 
#   3). 

# Note 3: 
#   Run through numeric variables and pick 
#   based on a deviance improvement. 

