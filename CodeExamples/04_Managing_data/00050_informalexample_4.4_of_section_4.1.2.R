# informalexample 4.4 of section 4.1.2 
# (informalexample 4.4 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 

> custdata$income.lt.20K <- custdata$income < 20000
> summary(custdata$income.lt.20K)
   Mode   FALSE    TRUE    NA's
logical     678     322       0

