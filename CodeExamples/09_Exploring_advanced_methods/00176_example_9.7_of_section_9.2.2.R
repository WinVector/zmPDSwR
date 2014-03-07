# example 9.7 of section 9.2.2 
# (example 9.7 of section 9.2.2)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : A one-dimensional regression example 
# Title: Linear regression applied to our artificial example 

> lin.model <- lm(y ~ x, data=train)
> summary(lin.model)
Call:
lm(formula = y ~ x, data = train)

Residuals:
    Min      1Q  Median      3Q     Max
-17.698  -1.774   0.193   2.499   7.529

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept)  -0.8330     0.1161  -7.175 1.51e-12 ***
x             0.7395     0.1197   6.180 9.74e-10 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 3.485 on 899 degrees of freedom
Multiple R-squared:  0.04075,   Adjusted R-squared:  0.03968
F-statistic: 38.19 on 1 and 899 DF,  p-value: 9.737e-10

#
# calculate the root mean squared error (rmse)
#
> resid.lin <- train$y-predict(lin.model)
> sqrt(mean(resid.lin^2))
[1] 3.481091

