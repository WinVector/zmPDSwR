# example 9.15 of section 9.2.5 
# (example 9.15 of section 9.2.5)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : Using GAM for logistic regression 
# Title: GAM logistic regression 

> form2 <- as.formula("DBWT<2000~s(PWGT)+s(WTGAIN)+
                                              s(MAGER)+s(UPREVIS)")
> glogmod <- gam(form2, data=train, family=binomial(link="logit"))

> glogmod$converged
[1] TRUE

> summary(glogmod)
Family: binomial 
Link function: logit 

Formula:
DBWT < 2000 ~ s(PWGT) + s(WTGAIN) + s(MAGER) + s(UPREVIS)

Parametric coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept) -3.94085    0.06794     -58   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Approximate significance of smooth terms: 
             edf Ref.df  Chi.sq  p-value    
s(PWGT)    1.905  2.420   2.463  0.36412    	# Note: 1 
s(WTGAIN)  3.674  4.543  64.426 1.72e-12 ***
s(MAGER)   1.003  1.005   8.335  0.00394 ** 
s(UPREVIS) 6.802  7.216 217.631  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

R-sq.(adj) =  0.0331   Deviance explained = 9.14% 	# Note: 2 
UBRE score = -0.76987  Scale est. = 1         n = 14386

# Note 1: 
#   Note that there’s no proof that the mother’s weight (PWGT) has a significant effect on 
#   outcome. 

# Note 2: 
#   “Deviance explained” is the pseudo R-squared: 1 - 
#   (deviance/null.deviance). 

