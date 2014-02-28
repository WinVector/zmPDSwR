# example 8.22 of section 8.2.3 
# (example 8.22 of section 8.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Inspecting rules 

brulesConf <- sort(brules, by="confidence")  	# Note: 1 

> inspect(head(lhs(brulesConf), n=5))      	# Note: 2 
  items
1 {Divine Secrets of the Ya-Ya Sisterhood: A Novel,
   Lucky : A Memoir}
2 {Lucky : A Memoir,
   The Notebook}
3 {Lucky : A Memoir,
   Wild Animus}
4 {Midwives: A Novel,
   Wicked: The Life and Times of the Wicked Witch of the West}
5 {Lucky : A Memoir,
   Summer Sisters}

# Note 1: 
#   Sort the rules by confidence. 

# Note 2: 
#   Use the lhs() function to get the left 
#   itemsets of each rule; then inspect the top 
#   five. 

