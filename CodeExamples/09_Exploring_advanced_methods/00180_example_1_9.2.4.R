# example:1_9.2.4 
# example:1 : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone
            relationships : Using GAM on actual data 
> form.lin <- as.formula("DBWT ~ PWGT + WTGAIN + MAGER + UPREVIS")
> linmodel <- lm(form.lin, data=train)  	# Note: 1 
> summary(linmodel)

Call:
lm(formula = form.lin, data = train)

Residuals:
     Min       1Q   Median       3Q      Max
-3044.35  -267.02    27.13   323.23  2797.13

Coefficients:
             Estimate Std. Error t value Pr(>|t|)
(Intercept) 2236.9901    31.7913   70.36   <2e-16 ***
PWGT           2.8869     0.1371   21.06   <2e-16 ***
WTGAIN         8.5438     0.3078   27.76   <2e-16 ***
MAGER          7.8842     0.7402   10.65   <2e-16 ***
UPREVIS       14.1309     1.1445   12.35   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 519.6 on 13568 degrees of freedom
Multiple R-squared:  0.09793,   Adjusted R-squared:  0.09766  	# Note: 2 
F-statistic: 368.2 on 4 and 13568 DF,  p-value: < 2.2e-16

> form.glin <- as.formula("DBWT ~ s(PWGT) + s(WTGAIN) +
+                        s(MAGER) + s(UPREVIS)")
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
(Intercept) 3307.187      4.417   748.8   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Approximate significance of smooth terms:
             edf Ref.df      F p-value
s(PWGT)    4.792  5.844  89.47  <2e-16 ***
s(WTGAIN)  4.669  5.693 134.04  <2e-16 ***
s(MAGER)   5.711  6.710  15.96  <2e-16 ***
s(UPREVIS) 4.875  5.815  44.50  <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

R-sq.(adj) =  0.115   Deviance explained = 11.6%          	# Note: 5 
GCV score = 2.652e+05  Scale est. = 2.6478e+05  n = 13573

# Note 1: 
#   Build a linear model with four 
#   variables 

# Note 2: 
#   The model explains about 10% of the variance; all coefficients are significantly different 
#   from zero 

# Note 3: 
#   Build a GAM with the same variables 

# Note 4: 
#   Verify that the model has converged 

# Note 5: 
#   The model explains about 11.5% of the variance; all variables have a non-linear effect 
#   significantly different from zero 
