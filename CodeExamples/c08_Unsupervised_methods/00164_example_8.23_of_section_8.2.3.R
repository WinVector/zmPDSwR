# example 8.23 of section 8.2.3 
# (example 8.23 of section 8.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Inspecting rules with restrictions 

brulesSub <- subset(brules, subset=!(lhs %in% "Lucky : A Memoir"))  	# Note: 1 
brulesConf <- sort(brulesSub, by="confidence")

> inspect(head(lhs(brulesConf), n=5))
  items
1 {Midwives: A Novel,
   Wicked: The Life and Times of the Wicked Witch of the West}
2 {She's Come Undone,
   The Secret Life of Bees,
   Wild Animus}
3 {A Walk to Remember,
   The Nanny Diaries: A Novel}
4 {Beloved,
   The Red Tent}
5 {The Da Vinci Code,
   The Reader}

# Note 1: 
#   Restrict to the subset of rules where 
#   Lucky is not in the left 
#   side. 

