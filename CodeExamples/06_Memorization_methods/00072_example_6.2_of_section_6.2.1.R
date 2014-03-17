# example 6.2 of section 6.2.1 
# (example 6.2 of section 6.2.1)  : Memorization methods : Building single-variable models : Using categorical features 
# Title: Plotting churn grouped by variable 218 levels 

table218 <- table(
   Var218=dTrain[,'Var218'], 	# Note: 1 
   churn=dTrain[,outcome], 	# Note: 2 
   useNA='ifany') 	# Note: 3 
print(table218)
      churn
Var218    -1     1
  cJvF 19101  1218
  UYBR 17599  1577
  <NA>   410   148

# Note 1: 
#   Tabulate levels of Var218. 

# Note 2: 
#   Tabulate levels of churn outcome. 

# Note 3: 
#   Include NA values in tabulation. 

