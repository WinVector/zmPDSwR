# example 9.20 of section 9.3.2 
# (example 9.20 of section 9.3.2)  : Exploring advanced methods : Using kernel methods to increase data separation : Using an explicit kernel on a problem 
# Title: Inspecting the results of the explicit kernel model 

> print(summary(m3))

Call:
lm(formula = log(PINCP, base = 10) ~ AGEP + SEXM +
    COWPrivate_not_for_profit_employee +
    SCHLAssociate_s_degree + SCHLBachelor_s_degree +
    SCHLDoctorate_degree +
    SCHLGED_or_alternative_credential + SCHLMaster_s_degree +
    SCHLProfessional_degree + SCHLRegular_high_school_diploma +
    SCHLsome_college_credit_no_degree + AGEP_AGEP, data = pMtrain)

Residuals:
     Min       1Q   Median       3Q      Max
-1.29264 -0.14925  0.01343  0.17021  0.61968

Coefficients:
                                Estimate Std. Error t value Pr(>|t|)
(Intercept)                   2.9400460  0.2219310  13.248  < 2e-16 ***
AGEP                          0.0663537  0.0124905   5.312 1.54e-07 ***
SEXM                          0.0934876  0.0224236   4.169 3.52e-05 ***
COWPrivate_not_for_profit_em -0.1187914  0.0379944  -3.127  0.00186 **
SCHLAssociate_s_degree        0.2317211  0.0509509   4.548 6.60e-06 ***
SCHLBachelor_s_degree         0.3844459  0.0417445   9.210  < 2e-16 ***
SCHLDoctorate_degree          0.3190572  0.1569356   2.033  0.04250 *
SCHLGED_or_alternative_creden 0.1405157  0.0766743   1.833  0.06737 .
SCHLMaster_s_degree           0.4553550  0.0485609   9.377  < 2e-16 ***
SCHLProfessional_degree       0.6525921  0.0845052   7.723 5.01e-14 ***
SCHLRegular_high_school_diplo 0.1016590  0.0415834   2.445  0.01479 *
SCHLsome_college_credit_no_de 0.1655906  0.0416345   3.977 7.85e-05 ***
AGEP_AGEP                    -0.0007547  0.0001704  -4.428 1.14e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.2649 on 582 degrees of freedom
Multiple R-squared:  0.3541,    Adjusted R-squared:  0.3408
F-statistic: 26.59 on 12 and 582 DF,  p-value: < 2.2e-16

