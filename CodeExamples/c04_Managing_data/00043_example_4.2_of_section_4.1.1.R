# example 4.2 of section 4.1.1 
# (example 4.2 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 
# Title: Remapping NA to a level 

> custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),  	# Note: 1 
                                   "missing",                    	# Note: 2 
                                   ifelse(custdata$is.employed==T, 	# Note: 3 
                                          "employed",
                                          "not employed"))  	# Note: 4 

> summary(as.factor(custdata$is.employed.fix)) 	# Note: 5 

    employed      missing not employed
         599          328           73

# Note 1: 
#   If is.employed value is missing... 

# Note 2: 
#   ...assign the value "missing". 
#   Otherwise... 

# Note 3: 
#   ...if is.employed==TRUE, assign the value 
#   "employed"... 

# Note 4: 
#   ...or the value "not employed". 

# Note 5: 
#   The transformation has turned the variable 
#   type from factor to string. You can change it back 
#   with the as.factor() function. 

