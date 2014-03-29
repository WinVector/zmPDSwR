# example 1.3 of section 1.3.1 
# (example 1.3 of section 1.3.1)  : The data science process : Setting expectations : Determining lower and upper bounds on model performance 
# Title: Plotting the relation between disposable income and loan outcome 

tab1 <- as.table(matrix(data=c(50,6,0,44),nrow=2,ncol=2))
dimnames(tab1) <- list('loan.as.pct.disposable.income'=
      c('LT.15pct','GT.15pct'),
   'loan.quality.pop1'=
      c('goodloan','badloan'))
tab2 <- as.table(matrix(data=c(34,18,16,32),nrow=2,ncol=2))
dimnames(tab2) <- list('loan.as.pct.disposable.income'=
      c('LT.15pct','GT.15pct'),
   'loan.quality.pop2'=
      c('goodloan','badloan'))
> tab1
                             loan.quality.pop1 	# Note: 1 
loan.as.pct.disposable.income goodloan badloan
                     LT.15pct       50       0
                     GT.15pct        6      44
> sum(diag(tab1))/sum(tab1)                  	# Note: 2 
[1] 0.94
>
> tab2
                             loan.quality.pop2  	# Note: 3 
loan.as.pct.disposable.income goodloan badloan
                     LT.15pct       34      16
                     GT.15pct       18      32
> sum(diag(tab2))/sum(tab2)
[1] 0.66                                                        	# Note: 4

# Note 1: 
#   The count of correct predictions is on the 
#   diagonal of tab1. In this first population, all 
#   the loans that were less than 15% of disposable 
#   income were good loans, and all but six of the 
#   loans that were greater than 15% of disposable 
#   income defaulted. So you know that 
#   loan.as.pct.disposable.income models loan quality 
#   well in this population. Or as statisticians might 
#   say, loan.as.pct.disposable.income “explains” the 
#   output (loan quality). 

# Note 2: 
#   In fact, it’s 94% accurate. 

# Note 3: 
#   In the second population, about a third of 
#   the loans that were less than 15% of disposable 
#   income defaulted, and over half of the loans that 
#   were greater than 15% of disposable income were 
#   good. So you know that 
#   loan.as.pct.disposable.income doesn’t model loan 
#   quality well in this population. 

# Note 4: 
#   The rule of thumb is only 66% 
#   accurate. 

