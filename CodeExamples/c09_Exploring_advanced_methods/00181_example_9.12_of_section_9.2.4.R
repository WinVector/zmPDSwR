# example 9.12 of section 9.2.4 
# (example 9.12 of section 9.2.4)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : Using GAM on actual data 
# Title: Plotting GAM results 

> terms <- predict(glinmodel, type="terms")       	# Note: 1 
> tframe <- cbind(DBWT = train$DBWT, as.data.frame(terms))   	# Note: 2 
> colnames(tframe) <- gsub('[()]', '', colnames(tframe))     	# Note: 3 
> pframe <- cbind(tframe, train[,c("PWGT", "WTGAIN",
                                       "MAGER", "UPREVIS")])        	# Note: 4 

> p1 <- ggplot(pframe, aes(x=PWGT)) +
   geom_point(aes(y=scale(sPWGT, scale=F))) +  	# Note: 5 
   geom_smooth(aes(y=scale(DBWT, scale=F))) +   	# Note: 6 
[...]  	# Note: 7

# Note 1: 
#   Get the matrix of s() 
#   functions. 

# Note 2: 
#   Bind in birth weight; convert to data 
#   frame. 

# Note 3: 
#   Make the column names reference-friendly 
#   (“s(PWGT)” is converted to “sPWGT”, etc.). 

# Note 4: 
#   Bind in the input variables. 

# Note 5: 
#   Plot s(PWGT) shifted to be zero mean versus PWGT (mother’s weight) as points. 

# Note 6: 
#   Plot the smoothing curve of DWBT (birth weight) shifted to be zero mean versus PWGT (mother’s 
#   weight). 

# Note 7: 
#   Repeat for remaining variables (omitted for 
#   brevity). 

