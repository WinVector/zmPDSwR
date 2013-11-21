
# SQL example in knitr Markdown

Material from [Practical Data Science with R examples GitHub archive](https://github.com/WinVector/zmPDSwR/)
In support of the Hotel/SQL example in Appendix B of [Practical Data Science with R](http://affiliate.manning.com/idevaffiliate.php?id=1273_360) by Nina Zumel and John Mount.


 * start with README.Rmd
 * produce README.md by running "knit('README.Rmd')" in R ( or "echo "library('knitr'); knit('README.Rmd')" | R --vanilla" from the bash shell)
 * produce README.html by running "pandoc README.md -o README.html" in bash shell


```r
library('xlsx')
```

```
## Loading required package: xlsxjars
## Loading required package: rJava
```

```r
bookings <- read.xlsx('Workbook1.xlsx',1,startRow=3)
prices <- read.xlsx('Workbook1.xlsx',2,startRow=3)

library('reshape2')
bthin <- melt(bookings,id.vars=c('date'),
   variable.name='daysBefore',value.name='bookings')
pthin <- melt(prices,id.vars=c('date'),
   variable.name='daysBefore',value.name='price')

daysCodes <- c('day.of.stay', 'X1.before', 'X2.before', 'X3.before')
bthin$nDaysBefore <- match(bthin$daysBefore,daysCodes)-1
pthin$nDaysBefore <- match(pthin$daysBefore,daysCodes)-1

# prevent sqldf from triggering tcl/tk dependency
# see: https://code.google.com/p/sqldf/ Troubleshooting
options(gsubfn.engine = "R")
library('sqldf')
```

```
## Loading required package: DBI
## Loading required package: gsubfn
## Loading required package: proto
## Loading required package: chron
## Loading required package: RSQLite
## Loading required package: RSQLite.extfuns
```

```r
joined <- sqldf('
  select
     bCurrent.date as StayDate,
     bCurrent.daysBefore as daysBefore,
     bCurrent.nDaysBefore as nDaysBefore,
     p.price as price,
     bCurrent.bookings as bookingsCurrent,
     bPrevious.bookings as bookingsPrevious,
     bCurrent.bookings - bPrevious.bookings as pickup
  from
     bthin bCurrent
  join
     bthin bPrevious
  on
     bCurrent.date=bPrevious.date
     and bCurrent.nDaysBefore+1=bPrevious.nDaysBefore
  join
     pthin p
  on
     bCurrent.date=p.date
     and bCurrent.nDaysBefore=p.nDaysBefore
')

library('ggplot2')
plt <- ggplot(data=joined,aes(x=price,y=pickup)) +
  geom_point() + geom_jitter() + geom_smooth(method='lm')
print(plt)
```

![plot of chunk allsteps](figure/allsteps.png) 

```r
ggsave(filename='HotelRelation.pdf',plot=plt)
```

```
## Saving 7 x 7 in image
```

```r

print(summary(lm(pickup~price,data=joined)))
```

```
## 
## Call:
## lm(formula = pickup ~ price, data = joined)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
##  -4.62  -2.81  -1.21   3.39   6.38 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept)  11.0077     7.9874    1.38      0.2
## price        -0.0280     0.0319   -0.88      0.4
## 
## Residual standard error: 4.21 on 10 degrees of freedom
## Multiple R-squared:  0.0714,	Adjusted R-squared:  -0.0214 
## F-statistic: 0.769 on 1 and 10 DF,  p-value: 0.401
```


