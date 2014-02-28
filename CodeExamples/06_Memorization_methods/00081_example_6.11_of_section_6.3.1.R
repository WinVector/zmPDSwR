# example 6.11 of section 6.3.1 
# (example 6.11 of section 6.3.1)  : Memorization methods : Building models using many variables : Variable selection 
# Title: Basic variable selection 

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
      baseRateCheck) - 1)
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
#   Run through categorical variables and pick 
#   based on a deviance improvement. 

