``` r
source('runDir.R')
```

``` r
runDir('../CodeExamples/c01_The_data_science_process',
       '../Statlog')
```

    [1] "############################### start  1 Fri Jun 17 10:32:19 2016"
    [1] "#####  running  ../CodeExamples/c01_The_data_science_process/00001_example_1.1_of_section_1.2.3.R"
    [1] "#####   in directory ../Statlog"

    > # example 1.1 of section 1.2.3 
    > # (example 1.1 of section 1.2.3)  : The data science process : Stages of a data science project : Modeling 
    > # Title: Building a decision tree 
    > 
    > library('rpart')

    > load('GCDData.RData')

    > model <- rpart(Good.Loan ~
        Duration.in.month +
        Installment.rate.in.percentage.of.disposable.income +
        Credit.amount  +
        Other.installment.plans,
        data=d,
        control=rpart.control(maxdepth=4),
        method="class")
    [1] "############################### end  1 Fri Jun 17 10:32:20 2016"
    [1] "############################### start  2 Fri Jun 17 10:32:20 2016"
    [1] "#####  running  ../CodeExamples/c01_The_data_science_process/00002_example_1.2_of_section_1.2.4.R"
    [1] "#####   in directory ../Statlog"

    > # example 1.2 of section 1.2.4 
    > # (example 1.2 of section 1.2.4)  : The data science process : Stages of a data science project : Model evaluation and critique 
    > # Title: Plotting the confusion matrix 
    > 
    > creditdata <- d

    > resultframe <- data.frame(Good.Loan=creditdata$Good.Loan,
                                pred=predict(model, type="class"))

    > rtab <- table(resultframe)    # Note: 1 

    > rtab
              pred
    Good.Loan  BadLoan GoodLoan
      BadLoan       41      259
      GoodLoan      13      687

    > ##           pred
    > ## Good.Loan  BadLoan GoodLoan
    > ##   BadLoan       41      259
    > ##   GoodLoan      13      687
    > 
    > sum(diag(rtab))/sum(rtab)     # Note: 2 
    [1] 0.728

    > ## [1] 0.728
    > sum(rtab[1,1])/sum(rtab[,1])  # Note: 3 
    [1] 0.7592593

    > ## [1] 0.7592593
    > sum(rtab[1,1])/sum(rtab[1,])  # Note: 4 
    [1] 0.1366667

    > ## [1] 0.1366667
    > sum(rtab[2,1])/sum(rtab[2,])  # Note: 5 
    [1] 0.01857143

    > ## [1] 0.01857143
    > 
    > # Note 1: 
    > #   Create the confusion matrix. Rows represent 
    > #   actual loan status; columns represent predicted 
    > #   loan status. The diagonal entries represent 
    > #   correct predictions. 
    > 
    > # Note 2: 
    > #   accuracyconfusion matrixOverall model accuracy: 73% of the predictions 
    > #   were correct. 
    > 
    > # Note 3: 
    > #   precisionconfusion matrixModel precision: 76% of the applicants 
    > #   predicted as bad really did default. 
    > 
    > # Note 4: 
    > #   recallconfusion matrixModel recall: the model found 14% of the 
    > #   defaulting loans. 
    > 
    > # Note 5: 
    > #   false positive rateconfusion matrixFalse positive rate: 2% of the good applicants 
    > #   were mistakenly identified as bad. 
    > 
    [1] "############################### end  2 Fri Jun 17 10:32:20 2016"
    [1] "############################### start  3 Fri Jun 17 10:32:20 2016"
    [1] "#####  running  ../CodeExamples/c01_The_data_science_process/00003_example_1.3_of_section_1.3.1.R"
    [1] "#####   in directory ../Statlog"

    > # example 1.3 of section 1.3.1 
    > # (example 1.3 of section 1.3.1)  : The data science process : Setting expectations : Determining lower and upper bounds on model performance 
    > # Title: Plotting the relation between disposable income and loan outcome 
    > 
    > tab1 <- as.table(matrix(data=c(50,6,0,44),nrow=2,ncol=2))

    > dimnames(tab1) <- list('loan.as.pct.disposable.income'=
           c('LT.15pct','GT.15pct'),
        'loan.quality.pop1'=
           c('goodloan','badloan'))

    > tab2 <- as.table(matrix(data=c(34,18,16,32),nrow=2,ncol=2))

    > dimnames(tab2) <- list('loan.as.pct.disposable.income'=
           c('LT.15pct','GT.15pct'),
        'loan.quality.pop2'=
           c('goodloan','badloan'))

    > tab1
                                 loan.quality.pop1
    loan.as.pct.disposable.income goodloan badloan
                         LT.15pct       50       0
                         GT.15pct        6      44

    > ##                              loan.quality.pop1     # Note: 1 
    > ## loan.as.pct.disposable.income goodloan badloan
    > ##                      LT.15pct       50       0
    > ##                      GT.15pct        6      44
    > sum(diag(tab1))/sum(tab1)                     # Note: 2 
    [1] 0.94

    > ## [1] 0.94
    > 
    > tab2
                                 loan.quality.pop2
    loan.as.pct.disposable.income goodloan badloan
                         LT.15pct       34      16
                         GT.15pct       18      32

    > ##                              loan.quality.pop2     # Note: 3 
    > ## loan.as.pct.disposable.income goodloan badloan
    > ##                      LT.15pct       34      16
    > ##                      GT.15pct       18      32
    > sum(diag(tab2))/sum(tab2)
    [1] 0.66

    > ## [1] 0.66                                                           # Note: 4
    > 
    > # Note 1: 
    > #   The count of correct predictions is on the 
    > #   diagonal of tab1. In this first population, all 
    > #   the loans that were less than 15% of disposable 
    > #   income were good loans, and all but six of the 
    > #   loans that were greater than 15% of disposable 
    > #   income defaulted. So you know that 
    > #   loan.as.pct.disposable.income models loan quality 
    > #   well in this population. Or as statisticians might 
    > #   say, loan.as.pct.disposable.income “explains” the 
    > #   output (loan quality). 
    > 
    > # Note 2: 
    > #   In fact, it’s 94% accurate. 
    > 
    > # Note 3: 
    > #   In the second population, about a third of 
    > #   the loans that were less than 15% of disposable 
    > #   income defaulted, and over half of the loans that 
    > #   were greater than 15% of disposable income were 
    > #   good. So you know that 
    > #   loan.as.pct.disposable.income doesn’t model loan 
    > #   quality well in this population. 
    > 
    > # Note 4: 
    > #   The rule of thumb is only 66% 
    > #   accurate. 
    > 
    [1] "############################### end  3 Fri Jun 17 10:32:20 2016"
