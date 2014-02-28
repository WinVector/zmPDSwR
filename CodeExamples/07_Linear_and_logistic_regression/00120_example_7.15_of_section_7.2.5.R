# example 7.15 of section 7.2.5 
# (example 7.15 of section 7.2.5)  : Linear and logistic regression : Using logistic regression : Reading the model summary and characterizing coefficients 
# Title: The model summary 

> summary(model)

Call:
glm(formula = fmla, family = binomial(link = "logit"), data = train)

Deviance Residuals:
    Min       1Q   Median       3Q      Max
-0.9732  -0.1818  -0.1511  -0.1358   3.2641

Coefficients:
                          Estimate Std. Error z value Pr(>|z|)
(Intercept)              -4.412189   0.289352 -15.249  < 2e-16 ***
PWGT                      0.003762   0.001487   2.530 0.011417 *
UPREVIS                  -0.063289   0.015252  -4.150 3.33e-05 ***
CIG_RECTRUE               0.313169   0.187230   1.673 0.094398 .
GESTREC3< 37 weeks        1.545183   0.140795  10.975  < 2e-16 ***
DPLURALtriplet or higher  1.394193   0.498866   2.795 0.005194 **
DPLURALtwin               0.312319   0.241088   1.295 0.195163
ULD_MECOTRUE              0.818426   0.235798   3.471 0.000519 ***
ULD_PRECIPTRUE            0.191720   0.357680   0.536 0.591951
ULD_BREECHTRUE            0.749237   0.178129   4.206 2.60e-05 ***
URF_DIABTRUE             -0.346467   0.287514  -1.205 0.228187
URF_CHYPERTRUE            0.560025   0.389678   1.437 0.150676
URF_PHYPERTRUE            0.161599   0.250003   0.646 0.518029
URF_ECLAMTRUE             0.498064   0.776948   0.641 0.521489
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 2698.7  on 14211  degrees of freedom
Residual deviance: 2463.0  on 14198  degrees of freedom
AIC: 2491

Number of Fisher Scoring iterations: 7

