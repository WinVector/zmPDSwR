# example:4_9.4.3 
# example:4 : Exploring advanced methods : Using SVMs to model complicated decision boundaries : Using SVMs on real data 
# Title: Shifting decision point to
                    perform an apples-to-apples comparison 

Shifting decision point to
                    perform an apples-to-apples comparisonsameCut <- sort(spamTest$pred)[length(spamTest$pred)-162] 	# Note: 1 
print(with(spamTest,table(y=spam,glPred=pred>sameCut))) 	# Note: 2 
##           glPred
## y          FALSE TRUE
##   non-spam   267   11
##   spam        29  151

# Note 1: 
#    Find out what GLM score threshold has 162 
#   examples above it.  

# Note 2: 
#    Ask the GLM model for its predictions that 
#   are above the threshold. We’re essentially asking the model for its 162 best 
#   candidate spam prediction results.  

