# example 6.2 of section 6.2.1 
# (example 6.2 of section 6.2.1)  : Memorization methods : Building single-variable models : Using categorical features 
# Title: Plotting churn grouped by variable 218 levels 

table218 <- table(
   Var218=dTrain[,'Var218'], 	# Note: 1 
   churn=dTrain[,outcome], 	# Note: 2 
   useNA='ifany') 	# Note: 3 
print(table218)
##       churn
## Var218    -1     1
##   cJvF 19245  1220
##   UYBR 17860  1618
##   <NA>   423   152
# Note this listing was updated: 10-14-2014 as some of results in the book were
# accidentally from older code.  Will update later listings as we go forward.

# Note 1: 
#   Tabulate levels of Var218. 

# Note 2: 
#   Tabulate levels of churn outcome. 

# Note 3: 
#   Include NA values in tabulation. 

