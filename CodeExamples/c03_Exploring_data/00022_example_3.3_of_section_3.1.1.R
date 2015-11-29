# example 3.3 of section 3.1.1 
# (example 3.3 of section 3.1.1)  : Exploring data : Using summary statistics to spot problems : Typical problems revealed by data summaries 
# Title: Examples of invalid values and outliers 

> summary(custdata$income)
   Min. 1st Qu.  Median    Mean 3rd Qu.
  -8700   14600   35000   53500   67000   	# Note: 1 
   Max.
 615000

> summary(custdata$age)
   Min. 1st Qu.  Median    Mean 3rd Qu.
    0.0    38.0    50.0    51.7    64.0   	# Note: 2 
   Max.
  146.7

# Note 1: 
#   Negative values for income could indicate 
#   bad data. They might also have a special meaning, like “amount of 
#   debt.” Either way, you should check how prevalent the issue is, 
#   and decide what to do: Do you drop the data with negative income? Do you 
#   convert negative values to zero? 

# Note 2: 
#   Customers of age zero, or customers of an 
#   age greater than about 110 are outliers. They fall out of the range of 
#   expected customer values. Outliers could be data input errors. 
#   They could be special sentinel values: zero might mean “age unknown” or 
#   “refuse to state.” And some of your customers might be especially 
#   long-lived. 

