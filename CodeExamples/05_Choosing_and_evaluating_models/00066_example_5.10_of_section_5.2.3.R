# example 5.10 of section 5.2.3 
# (example 5.10 of section 5.2.3)  : Choosing and evaluating models : Evaluating models : Evaluating probability models 
# Title: Calculating entropy and conditional entropy 

> entropy <- function(x) { 	# Note: 1 
    xpos <- x[x>0]
    scaled <- xpos/sum(xpos)
    sum(-scaled*log(scaled,2))
  }

> print(entropy(table(spamTest$spam))) 	# Note: 2 
[1] 0.9667165

> conditionalEntropy <- function(t) { 	# Note: 3 
    (sum(t[,1])*entropy(t[,1]) + sum(t[,2])*entropy(t[,2]))/sum(t)
  }

> print(conditionalEntropy(cM)) 	# Note: 4 
[1] 0.3971897

# Note 1: 
#   Define function that computes the entropy 
#   from list of outcome counts 

# Note 2: 
#   Calculate entropy of spam/non-spam 
#   distribution 

# Note 3: 
#   Function to calculate conditional or 
#   remaining entropy of spam distribution (rows) 
#   given prediction (columns) 

# Note 4: 
#   Calculate conditional or remaining entropy 
#   of spam distribution given prediction 

