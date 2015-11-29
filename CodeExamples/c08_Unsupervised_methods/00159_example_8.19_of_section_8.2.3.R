# example 8.19 of section 8.2.3 
# (example 8.19 of section 8.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Finding the association rules 

> rules <- apriori(bookbaskets_use,                                  	# Note: 1 
                parameter =list(support = 0.002, confidence=0.75))

> summary(rules)
set of 191 rules                            	# Note: 2 

rule length distribution (lhs + rhs):sizes         	# Note: 3 
  2   3   4   5
 11 100  66  14

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
  2.000   3.000   3.000   3.435   4.000   5.000

summary of quality measures:                           	# Note: 4 
    support           confidence          lift
 Min.   :0.002009   Min.   :0.7500   Min.   : 40.89
 1st Qu.:0.002131   1st Qu.:0.8113   1st Qu.: 86.44
 Median :0.002278   Median :0.8468   Median :131.36
 Mean   :0.002593   Mean   :0.8569   Mean   :129.68
 3rd Qu.:0.002695   3rd Qu.:0.9065   3rd Qu.:158.77
 Max.   :0.005830   Max.   :0.9882   Max.   :321.89

mining info:                                           	# Note: 5 
            data ntransactions support confidence
 bookbaskets_use         40822   0.002       0.75

# Note 1: 
#   Call apriori() with a minimum support of 
#   0.002 and a minimum confidence of 0.75. 

# Note 2: 
#   The summary of the apriori() output reports 
#   the number of rules found;... 

# Note 3: 
#   ...the distribution of rule lengths (in this 
#   example, most rules contain 3 items—2 on the left 
#   side, X (lhs), and one on the right side, Y 
#   (rhs));... 

# Note 4: 
#   ...a summary of rule quality measures, 
#   including support and confidence;... 

# Note 5: 
#   ...and some information on how apriori() was 
#   called. 

