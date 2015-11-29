# example 9.19 of section 9.3.2 
# (example 9.19 of section 9.3.2)  : Exploring advanced methods : Using kernel methods to increase data separation : Using an explicit kernel on a problem 
# Title: Modeling using the explicit kernel transform 

formulaStr2 <- paste('log(PINCP,base=10)',
   paste(vars,collapse=' + '),
   sep=' ~ ')
m2 <- lm(as.formula(formulaStr2),data=pMtrain)
coef2 <- summary(m2)$coefficients
interestingVars <- setdiff(rownames(coef2)[coef2[,'Pr(>|t|)']<0.01],
                              '(Intercept)')
interestingVars <- union(colnames(modelMatrix),interestingVars) 	# Note: 1 
formulaStr3 <- paste('log(PINCP,base=10)',
                    paste(interestingVars,collapse=' + '),
                    sep=' ~ ')
m3 <- step(lm(as.formula(formulaStr3),data=pMtrain),direction='both') 	# Note: 2 
print(rmse(log(pMtest$PINCP,base=10),predict(m3,newdata=pMtest))) 	# Note: 3 
# [1] 0.2735955

# Note 1: 
#   Select a set of interesting variables by building an initial model using all of the new 
#   variables and retaining an interesting subset. This is an ad hoc 
#   move to speed up the stepwise regression by trying to quickly 
#   dispose of many useless derived variables. By introducing many new 
#   variables, the primal kernel method also introduces many new degrees 
#   of freedom, which can invite overfitting. 

# Note 2: 
#   Stepwise regress on subset of variables to 
#   get new model. 

# Note 3: 
#   Calculate the RMSE between the prediction and the actuals. 

