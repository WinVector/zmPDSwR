# informalexample:2_B.2.4 
# informalexample:2 : Some Important Statistical Concepts : Statistical theory : Specialized statistical tests 
with(d,cor(EarnedIncome,CapitalGains,method='spearman'))
# [1] 0.03083108
with(d,cor.test(EarnedIncome,CapitalGains,method='spearman'))
#
#       Spearman's rank correlation rho
#
#data:  EarnedIncome and CapitalGains
#S = 161512, p-value = 0.7604
#alternative hypothesis: true rho is not equal to 0
#sample estimates:
#       rho
#0.03083108
