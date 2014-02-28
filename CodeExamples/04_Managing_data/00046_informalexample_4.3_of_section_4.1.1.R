# informalexample 4.3 of section 4.1.1 
# (informalexample 4.3 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 

> meanIncome <- mean(custdata$Income, na.rm=T) 	# Note: 1 
> Income.fix <- ifelse(is.na(custdata$Income),
                       meanIncome,
                       custdata$Income)
> summary(Income.fix)

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
      0   35000   66200   66200   66200  615000

# Note 1: 
#   Don’t forget the argument "na.rm=T"! 
#   Otherwise, the mean() function will include the 
#   NAs by default, and meanIncome will be NA. 

