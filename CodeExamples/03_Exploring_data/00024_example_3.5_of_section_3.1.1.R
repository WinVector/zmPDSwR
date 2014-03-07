# example 3.5 of section 3.1.1 
# (example 3.5 of section 3.1.1)  : Exploring data : Using summary statistics to spot problems : Typical problems revealed by data summaries 
# Title: Checking units sounds silly, but mistakes can lead to spectacular errors if not caught 

> summary(Income)                                	# Note: 1 
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
   -8.7    14.6    35.0    53.5    67.0   615.0

# Note 1: 
#   The variable Income is defined as Income = custdata$income/1000. But suppose you didn’t know 
#   that. Looking only at the summary, the values could plausibly be 
#   interpreted to mean either “hourly wage” or “yearly income in units 
#   of $1000.” 

