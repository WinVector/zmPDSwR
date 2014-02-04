# informalexample:1_6.2.1 
# informalexample:1 : Memorization methods : Building single-variable models : Using categorical features 
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
#    
#   Tabulate levels of Var28. 
#    

# Note 2: 
#    
#   Tabulate levels of churn outcome. 
#    

# Note 3: 
#    
#   Include NA values in tabulation. 
#    
