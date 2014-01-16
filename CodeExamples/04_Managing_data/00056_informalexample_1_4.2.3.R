# informalexample:1_4.2.3 
# informalexample:1 : Managing data : Sampling for modeling and validation : Record grouping 
hh <- unique(hhdata$household_id) 	# Note: 1 
households <- data.frame(household_id = hh, gp = runif(length(hh))) 	# Note: 2 
hhdata <- merge(hhdata, households, by="household_id") 	# Note: 3 

# Note 1: 
#   Get all unique household IDs from your data frame.  

# Note 2: 
#   Create a temporary data frame of household IDs and a 
#   uniformly random number from zero to one.  

# Note 3: 
#   Merge new random sample group column back into original 
#   data frame.  
