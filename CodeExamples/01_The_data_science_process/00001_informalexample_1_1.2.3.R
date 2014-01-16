# informalexample:1_1.2.3 
# informalexample:1 : The data science process : The stages of a data science project : Modeling  
library('rpart')
load('GCDData.RData')
model <- rpart(Good.Loan ~
   Duration.in.month +
   Installment.rate.in.percentage.of.disposable.income +
   Credit.amount  +
   Other.installment.plans,
   data=d,
   control=rpart.control(maxdepth=4),
   method="class")
