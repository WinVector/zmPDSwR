

# Example code and data for "Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014.


 * The book: ["Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014](http://www.manning.com/zumel/)  (book copyright Manning Publications Co., all rights reserved)
 * The support site: [GitHub WinVector/zmPDSwR](https://github.com/WinVector/zmPDSwR)


## The code and data in this directory supports examples from:
 * Appendix A: Working with R And Other Tools

# SQL example in knitr Markdown

Material from [Practical Data Science with R examples GitHub archive](https://github.com/WinVector/zmPDSwR/)
In support of the Hotel/SQL example in Appendix A of [Practical Data Science with R](http://www.manning.com/zumel/) by Nina Zumel and John Mount.


 * start with README.Rmd and Workbook1.xlsx
 * produce README.md, HotelRelation.pdf and figure/* by running "knit('README.Rmd')" in R
 * produce README.html by running "pandoc README.md -o README.html" in bash shell
 * or all in one shot at the bash shell: echo "library('knitr'); knit('README.Rmd')" | R --vanilla ; pandoc README.md -o README.html


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


## Code example license
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
