# informalexample:4_7.1.5 
# informalexample:4 : Linear and logistic regression : Using linear regression : Reading the model summary and characterizing coefficient
                                quality 
# Title: Overall model quality summaries 

df <- dim(dtrain)[1] - dim(summary(model)$coefficients)[1]

