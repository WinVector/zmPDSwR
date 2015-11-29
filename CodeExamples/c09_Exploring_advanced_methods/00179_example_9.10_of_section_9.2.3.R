# example 9.10 of section 9.2.3 
# (example 9.10 of section 9.2.3)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : Extracting the nonlinear relationships 
# Title: Extracting a learned spline from a GAM 

> sx <- predict(glin.model, type="terms")
> summary(sx)
      s(x)
 Min.   :-17.527035
 1st Qu.: -2.378636
 Median :  0.009427
 Mean   :  0.000000
 3rd Qu.:  2.869166
 Max.   :  4.084999

> xframe <- cbind(train, sx=sx[,1])

> ggplot(xframe, aes(x=x)) + geom_point(aes(y=y), alpha=0.4) +
                             geom_line(aes(y=sx))

