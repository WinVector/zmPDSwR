# example B.14 of section B.2.2 
# (example B.14 of section B.2.2)  : Important statistical concepts : Statistical theory : A/B tests 
# Title: Calculating the observed A and B rates 

aConversionRate <- tab['A','1']/sum(tab['A',])
print(aConversionRate)
## [1] 0.05021
bConversionRate <- tab['B','1']/sum(tab['B',])
print(bConversionRate)
## [1] 0.0602
commonRate <- sum(tab[,'1'])/sum(tab)
print(commonRate)
## [1] 0.05111818

