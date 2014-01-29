# example:4_9.4.3 
# example:4 : Exploring advanced methods : Using support vector machines to model complicated decision
            boundaries : Using SVMs on real data 
> sameCut <- sort(spamTest$pred)[length(spamTest$pred)-160] 	# Note: 1 
> print(with(spamTest,table(y=spam,glPred=pred>sameCut))) 	# Note: 2 
          glPred
y          FALSE TRUE
  non-spam   268   10
  spam        30  150

# Note 1: 
#   Find out what GLM score threshold has 160 examples 
#   above it. 

# Note 2: 
#   Ask the GLM model for its 
#   predictions that are above the threshold. We’re essentially asking the 
#   model for its 160 best candidate spam prediction results. 
