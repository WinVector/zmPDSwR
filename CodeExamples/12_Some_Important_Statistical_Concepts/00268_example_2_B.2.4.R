# example:2_B.2.4 
# example:2 : Some important statistical concepts : Statistical theory : Specialized statistical tests 
# Title: 
                Calculating the (non)significance of the observed correlation 


                Calculating the (non)significance of the observed correlation
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

