# example 4.1 of section 4.1.1 
# (example 4.1 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 
# Title: Checking locations of missing data 

> summary(custdata[is.na(custdata$housing.type), 	# Note: 1 
                   c("recent.move","num.vehicles")]) 	# Note: 2 

 recent.move     num.vehicles   	# Note: 3 
 Mode:logical   Min.   : NA
 NA's:56        1st Qu.: NA
                Median : NA
                Mean   :NaN
                3rd Qu.: NA
                Max.   : NA
                NA's   :56

# Note 1: 
#   Restrict to the rows where housing.type is 
#   NA. 

# Note 2: 
#   Look only at the columns recent.move and 
#   num.vehicles. 

# Note 3: 
#   The output: all NAs. All the missing data 
#   comes from the same rows. 

