# example 1.2 of section 1.2.4 
# (example 1.2 of section 1.2.4)  : The data science process : Stages of a data science project : Model evaluation and critique 
# Title: Plotting the confusion matrix 

> creditdata <- d
> resultframe <- data.frame(Good.Loan=creditdata$Good.Loan,
                           pred=predict(model, type="class"))
> rtab <- table(resultframe) 	# Note: 1 
> rtab
          pred
Good.Loan  BadLoan GoodLoan
  BadLoan       41      259
  GoodLoan      13      687

> sum(diag(rtab))/sum(rtab)  	# Note: 2 
[1] 0.728
> sum(rtab[1,1])/sum(rtab[,1]) 	# Note: 3 
[1] 0.7592593
> sum(rtab[1,1])/sum(rtab[1,]) 	# Note: 4 
[1] 0.1366667
> sum(rtab[2,1])/sum(rtab[2,]) 	# Note: 5 
[1] 0.01857143

# Note 1: 
#   Create the confusion matrix. Rows represent 
#   actual loan status; columns represent predicted 
#   loan status. The diagonal entries represent 
#   correct predictions. 

# Note 2: 
#   accuracyconfusion matrixOverall model accuracy: 73% of the predictions 
#   were correct. 

# Note 3: 
#   precisionconfusion matrixModel precision: 76% of the applicants 
#   predicted as bad really did default. 

# Note 4: 
#   recallconfusion matrixModel recall: the model found 14% of the 
#   defaulting loans. 

# Note 5: 
#   false positive rateconfusion matrixFalse positive rate: 2% of the good applicants 
#   were mistakenly identified as bad. 

