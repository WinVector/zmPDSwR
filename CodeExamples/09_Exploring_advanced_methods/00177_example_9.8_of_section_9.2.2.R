# example 9.8 of section 9.2.2 
# (example 9.8 of section 9.2.2)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : A one-dimensional regression example 
# Title: GAM applied to our artificial example 

> library(mgcv)                             	# Note: 1 
> glin.model <- gam(y~s(x), data=train)  	# Note: 2 
> glin.model$converged                      	# Note: 3 
[1] TRUE

> summary(glin.model)

Family: gaussian                                	# Note: 4 
Link function: identity

Formula:
y ~ s(x)

Parametric coefficients:                       	# Note: 5 
            Estimate Std. Error t value Pr(>|t|)
(Intercept) -0.83467    0.04852   -17.2   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Approximate significance of smooth terms:       	# Note: 6 
       edf Ref.df     F p-value
s(x) 8.685  8.972 497.8  <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

R-sq.(adj) =  0.832   Deviance explained = 83.4%          	# Note: 7 
GCV score =  2.144  Scale est. = 2.121     n = 901

#
# calculate the root mean squared error (rmse)
#
> resid.glin <- train$y-predict(glin.model)
> sqrt(mean(resid.glin^2))
[1] 1.448514

# Note 1: 
#   Load the mgcv package. 

# Note 2: 
#   Build the model, specifying that x should be 
#   treated as a nonlinear variable. 

# Note 3: 
#   The converged parameter tells you if the algorithm 
#   converged. You should only trust the output if this is TRUE. 

# Note 4: 
#   Setting family=gaussian and link=identity tells you that the model was treated with the same 
#   distributions assumptions as a standard linear regression. 

# Note 5: 
#   The parametric coefficients are the linear terms (in this example, only the constant term). 
#   This section of the summary tells you which linear terms were 
#   significantly different from 0. 

# Note 6: 
#   The smooth terms are the nonlinear terms. This section of the summary tells you which 
#   nonlinear terms were significantly different from 0. It also tells you 
#   the effective degrees of freedom (edf) used up to build each smooth 
#   term. An edf near 1 indicates that the variable has an approximately 
#   linear relationship to the output. 

# Note 7: 
#   “R-sq (adj)” is the adjusted R-squared. “Deviance 
#   explained” is the raw R-squared (0.834). 

