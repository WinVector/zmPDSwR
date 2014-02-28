# example 9.17 of section 9.3.2 
# (example 9.17 of section 9.3.2)  : Exploring advanced methods : Using kernel methods to increase data separation : Using an explicit kernel on a problem 
# Title: Applying stepwise linear regression to PUMS data 

dtrain <- subset(psub,ORIGRANDGROUP >= 500)
dtest <- subset(psub,ORIGRANDGROUP < 500)  	# Note: 1 
m1 <- step( 	# Note: 2 
   lm(log(PINCP,base=10) ~ AGEP + SEX + COW + SCHL,
      data=dtrain), 	# Note: 3 
   direction='both')
rmse <- function(y, f) { sqrt(mean( (y-f)^2 )) } 	# Note: 4 
print(rmse(log(dtest$PINCP,base=10),
   predict(m1,newdata=dtest))) 	# Note: 5 
# [1] 0.2752171

# Note 1: 
#   Split data into test and training. 

# Note 2: 
#   Ask that the linear regression model we’re building be 
#   stepwise improved, which is a powerful automated procedure for 
#   removing variables that don’t seem to have significant impacts 
#   (can improve generalization performance). 

# Note 3: 
#   Build the basic linear regression model. 

# Note 4: 
#   Define the RMSE function. 

# Note 5: 
#   Calculate the RMSE between the prediction and the 
#   actuals. 

