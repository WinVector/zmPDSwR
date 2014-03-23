# example B.23 of section B.3.1 
# (example B.23 of section B.3.1)  : Important statistical concepts : Examples of the statistical view of data : Sampling bias 
# Title: Misleading significance result from biased observations 

veryHighIncome <- subset(d, EarnedIncome+CapitalGains>=500000)
print(with(veryHighIncome,cor.test(EarnedIncome,CapitalGains,
    method='spearman')))
#
#       Spearman's rank correlation rho
#
#data:  EarnedIncome and CapitalGains
#S = 1046, p-value < 2.2e-16
#alternative hypothesis: true rho is not equal to 0
#sample estimates:
#       rho
#-0.8678571

