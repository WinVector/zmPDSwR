# example 4.7 of section 4.1.2 
# (example 4.7 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 
# Title: Centering on mean age 

> summary(custdata$age)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
    0.0    38.0    50.0    51.7    64.0   146.7
> meanage <- mean(custdata$age)
> custdata$age.normalized <- custdata$age/meanage
> summary(custdata$age.normalized)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
 0.0000  0.7350  0.9671  1.0000  1.2380  2.8370

