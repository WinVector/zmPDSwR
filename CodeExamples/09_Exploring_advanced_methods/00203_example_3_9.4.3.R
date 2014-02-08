# example:3_9.4.3 
# example:3 : Exploring advanced methods : Using support vector machines to model complicated decision
            boundaries : Using SVMs on real data 
# Title: Printing the SVM results summary 

> print(summary(svmM))
Length  Class   Mode
     1   ksvm     S4
> print(svmM)
Support Vector Machine object of class "ksvm"

SV type: C-svc  (classification)
 parameter : cost C = 10

Gaussian Radial Basis kernel function.
 Hyperparameter : sigma =  0.0300518888320615

Number of Support Vectors : 1117

Objective Function Value : -4635.266
Training error : 0.02824
Cross validation error : 0.076275
Probability model included.

