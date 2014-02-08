# informalexample:10_8.2.3 
# informalexample:10 : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Inspecting and evaluating rules 

inspect(head((sort(rules, by="confidence")), n=5))

