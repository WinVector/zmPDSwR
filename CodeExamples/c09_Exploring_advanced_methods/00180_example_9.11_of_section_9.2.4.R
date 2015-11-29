# example 9.11 of section 9.2.4 
# (example 9.11 of section 9.2.4)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : Using GAM on actual data 
# Title: Applying linear regression (with and without GAM) to health data 

> library(mgcv)
> library(ggplot2)
> load("NatalBirthData.rData")
> train <- sdata[sdata$ORIGRANDGROUP<=5,]
> test <- sdata[sdata$ORIGRANDGROUP>5,]
> form.lin <- as.formula("DBWT ~ PWGT + WTGAIN + MAGER + UPREVIS")
> linmodel <- lm(form.lin, data=train)  	# Note: 1 
> summary(linmodel)

Call:
lm(formula = form.lin, data = train)

Residuals:
     Min       1Q   Median       3Q      Max 
-3155.43  -272.09    45.04   349.81  2870.55 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 2419.7090    31.9291  75.784  < 2e-16 ***
PWGT           2.1713     0.1241  17.494  < 2e-16 ***
WTGAIN         7.5773     0.3178  23.840  < 2e-16 ***
MAGER          5.3213     0.7787   6.834  8.6e-12 ***
UPREVIS       12.8753     1.1786  10.924  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 562.7 on 14381 degrees of freedom
Multiple R-squared:  0.06596, Adjusted R-squared:  0.0657 	# Note: 2 
F-statistic: 253.9 on 4 and 14381 DF,  p-value: < 2.2e-16

> form.glin <- as.formula("DBWT ~ s(PWGT) + s(WTGAIN) +
                        s(MAGER) + s(UPREVIS)")
> glinmodel <- gam(form.glin, data=train)                    	# Note: 3 
> glinmodel$converged                                          	# Note: 4 
[1] TRUE
> summary(glinmodel)

Family: gaussian 
Link function: identity 

Formula:
DBWT ~ s(PWGT) + s(WTGAIN) + s(MAGER) + s(UPREVIS)

Parametric coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 3276.948      4.623   708.8   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Approximate significance of smooth terms:
             edf Ref.df       F  p-value    
s(PWGT)    5.374  6.443  68.981  < 2e-16 ***
s(WTGAIN)  4.719  5.743 102.313  < 2e-16 ***
s(MAGER)   7.742  8.428   6.959 1.82e-09 ***
s(UPREVIS) 5.491  6.425  48.423  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

R-sq.(adj) =  0.0927   Deviance explained = 9.42% 	# Note: 5 
GCV score = 3.0804e+05  Scale est. = 3.0752e+05  n = 14386

# Note 1: 
#   Build a linear model with four 
#   variables. 

# Note 2: 
#   The model explains about 7% of the variance; all 
#   coefficients are significantly different from 0. 

# Note 3: 
#   Build a GAM with the same 
#   variables. 

# Note 4: 
#   Verify that the model has 
#   converged. 

# Note 5: 
#   The model explains just under 10% of the variance; 
#   all variables have a nonlinear effect significantly different from 
#   0. 

