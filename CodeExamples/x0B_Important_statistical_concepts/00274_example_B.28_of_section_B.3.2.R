# example B.28 of section B.3.2 
# (example B.28 of section B.3.2)  : Important statistical concepts : Examples of the statistical view of data : Omitted variable bias 
# Title: A better model 

print(summary(glm(data=s,
   FractionHumanAbsorption~week+log(Caco2A2BPapp),
   family=binomial(link='logit'))))
## Warning: non-integer #successes in a binomial glm!
## 
## Call:
## glm(formula = FractionHumanAbsorption ~ week + log(Caco2A2BPapp), 
##     family = binomial(link = "logit"), data = s)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.3474  -0.0568  -0.0010   0.0709   0.3038  
## 
## Coefficients:
##                   Estimate Std. Error z value Pr(>|z|)   
## (Intercept)         3.1413     4.6837    0.67   0.5024   
## week                0.1033     0.0386    2.68   0.0074 **
## log(Caco2A2BPapp)   0.5689     0.5419    1.05   0.2938   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 43.7821  on 99  degrees of freedom
## Residual deviance:  1.2595  on 97  degrees of freedom
## AIC: 47.82
## 
## Number of Fisher Scoring iterations: 6

