# example B.26 of section B.3.2 
# (example B.26 of section B.3.2)  : Important statistical concepts : Examples of the statistical view of data : Omitted variable bias 
# Title: Building data that improves over time 

set.seed(2535251)
s <- data.frame(week=1:100)
s$Caco2A2BPapp <- sort(sample(d$Caco2A2BPapp,100,replace=T),
   decreasing=T)
sigmoid <- function(x) {1/(1+exp(-x))}
s$FractionHumanAbsorption <- 	# Note: 1 
 sigmoid(
   7.5 + 0.5*log(s$Caco2A2BPapp) + 	# Note: 2 
   s$week/10 - mean(s$week/10) + 	# Note: 3 
   rnorm(100)/3 	# Note: 4 
   )
write.table(s,'synth.csv',sep=',',
   quote=F,row.names=F)

# Note 1: 
#   Build synthetic examples. 

# Note 2: 
#   Add in Caco2 to absorption relation learned from original dataset. Note the relation is 
#   positive: better Caco2 always drives better absorption in our 
#   synthetic dataset. We’re log transforming Caco2, as it has over 3 
#   decades of range. 

# Note 3: 
#   Add in a mean-0 term that depends on time to simulate the effects of improvements as the 
#   project moves forward. 

# Note 4: 
#   Add in a mean-0 noise term. 

