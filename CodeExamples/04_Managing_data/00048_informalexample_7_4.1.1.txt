# informalexample:7_4.1.1 
# informalexample:7 : Managing data : Cleaning data : Treating missing values (NAs) 
missingIncome <- is.na(custdata$Income)  	# Note: 1 
Income.fix <- ifelse(is.na(custdata$Income), 0, custdata$Income) 	# Note: 2 

# Note 1: 
#   The missingIncome variable lets you 
#   differentiate the two kinds of zeros in the data: the ones that you are 
#   about to add, and the ones that were already there.  

# Note 2: 
#   Replace the NAs with zeros.  
