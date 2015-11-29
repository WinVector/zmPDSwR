# example 8.21 of section 8.2.3 
# (example 8.21 of section 8.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Finding rules with restrictions 

brules <- apriori(bookbaskets_use,
                parameter =list(support = 0.001,    	# Note: 1 
                                confidence=0.6),
                appearance=list(rhs=c("The Lovely Bones: A Novel"),  	# Note: 2 
                                default="lhs"))                      	# Note: 3 
> summary(brules)
set of 46 rules

rule length distribution (lhs + rhs):sizes
 3  4
44  2

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
  3.000   3.000   3.000   3.043   3.000   4.000

summary of quality measures:
    support           confidence          lift
 Min.   :0.001004   Min.   :0.6000   Min.   :21.81
 1st Qu.:0.001029   1st Qu.:0.6118   1st Qu.:22.24
 Median :0.001102   Median :0.6258   Median :22.75
 Mean   :0.001132   Mean   :0.6365   Mean   :23.14
 3rd Qu.:0.001219   3rd Qu.:0.6457   3rd Qu.:23.47
 Max.   :0.001396   Max.   :0.7455   Max.   :27.10

mining info:
            data ntransactions support confidence
 bookbaskets_use         40822   0.001        0.6

# Note 1: 
#   Relax the minimum support to 0.001 and the 
#   minimum confidence to 0.6. 

# Note 2: 
#   Only The Lovely Bones 
#   is allowed to appear on the right side of the 
#   rules. 

# Note 3: 
#   By default, all the books can go into the 
#   left side of the rules. 

