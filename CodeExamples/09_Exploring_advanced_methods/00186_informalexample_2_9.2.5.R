# informalexample:2_9.2.5 
# informalexample:2 : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone
            relationships : Using GAM for logistic regression 
> form2 < as.formula("DBWT<2000~s(PWGT)+s(WTGAIN)+
                                              s(MAGER)+s(UPREVIS)")
> glogmod < gam(form2, data=train, family=binomial(link="logit"))

> glogmod$converged
[1] TRUE

> summary(glogmod)
Family: binomial
Link function: logit

Formula:
DBWT < 2000 ~ s(PWGT) + s(WTGAIN) + s(MAGER) + s(UPREVIS)

Parametric coefficients:
            Estimate Std. Error z value Pr(>|z|)
(Intercept) -4.35651    0.08617  -50.55   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Approximate significance of smooth terms:           	# Note: 1 
             edf Ref.df  Chi.sq  p-value
s(PWGT)    4.072  5.033   7.372    0.197
s(WTGAIN)  3.110  3.910  60.471 2.94e-12 ***
s(MAGER)   1.000  1.001   0.021    0.886
s(UPREVIS) 4.816  5.684 159.071  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

R-sq.(adj) =  0.0337   Deviance explained = 10.6%    	# Note: 2 
UBRE score = -0.82445  Scale est. = 1         n = 13573

# Note 1: 
#   Note that in this case, only the mother’s weight gain during pregnancy (WTGAIN) and the number 
#   of pre-natal visits (UPREVIS) have a significant effect on 
#   outcome 

# Note 2: 
#   “Deviance explained” is the pseudo-R-squared: 1 - (deviance/null.deviance). 
