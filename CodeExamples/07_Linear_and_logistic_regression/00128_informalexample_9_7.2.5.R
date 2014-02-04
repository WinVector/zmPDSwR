# informalexample:9_7.2.5 
# informalexample:9 : Linear and logistic regression : Using logistic regression : Reading the model summary and characterizing coefficients 
pr2 <- 1-(resid.dev/null.dev)

> print(pr2)
[1] 0.08734674
> pr2.test <- 1-(resid.dev.test/null.dev.test)
> print(pr2.test)
[1] 0.07760427
