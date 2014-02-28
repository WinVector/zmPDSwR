# example 4.5 of section 4.1.2 
# (example 4.5 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 
# Title: Normalizing income by state 

> summary(medianincome)  	# Note: 1 

        State    Median.Income
           : 1   Min.   :37427
 Alabama   : 1   1st Qu.:47483
 Alaska    : 1   Median :52274
 Arizona   : 1   Mean   :52655
 Arkansas  : 1   3rd Qu.:57195
 California: 1   Max.   :68187
 (Other)   :46

> custdata <- merge(custdata, medianincome,
                   by.x="state.of.res", by.y="State")  	# Note: 2 

> summary(custdata[,c("state.of.res", "income", "Median.Income")]) 	# Note: 3 

       state.of.res     income       Median.Income
 California  :100   Min.   : -8700   Min.   :37427
 New York    : 71   1st Qu.: 14600   1st Qu.:44819
 Pennsylvania: 70   Median : 35000   Median :50977
 Texas       : 56   Mean   : 53505   Mean   :51161
 Michigan    : 52   3rd Qu.: 67000   3rd Qu.:55559
 Ohio        : 51   Max.   :615000   Max.   :68187
 (Other)     :600

> custdata$income.norm <- with(custdata, income/Median.Income) 	# Note: 4 

> summary(custdata$income.norm)

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
-0.1791  0.2729  0.6992  1.0820  1.3120 11.6600

# Note 1: 
#   Suppose medianincome is a data frame of median 
#   income by state. 

# Note 2: 
#   Merge median income information into the 
#   custdata data frame by matching the column 
#   custdata$state.of.res to the column 
#   medianincome$State. 

# Note 3: 
#   Median.Income is now part of custdata. 

# Note 4: 
#   Normalize income by Median.Income. 

