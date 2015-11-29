# example 2.13 of section 2.2.3 
# (example 2.13 of section 2.2.3)  : Loading data into R : Working with relational databases : Working with the PUMS data 
# Title: Recoding variables 

psub$SEX = as.factor(ifelse(psub$SEX==1,'M','F')) 	# Note: 1 
psub$SEX = relevel(psub$SEX,'M') 	# Note: 2 
cowmap <- c("Employee of a private for-profit",
   "Private not-for-profit employee",
   "Local government employee",
   "State government employee",
   "Federal government employee",
   "Self-employed not incorporated",
   "Self-employed incorporated")
psub$COW = as.factor(cowmap[psub$COW]) 	# Note: 3 
psub$COW = relevel(psub$COW,cowmap[1])
schlmap = c(  	# Note: 4 
   rep("no high school diploma",15),
  "Regular high school diploma",
  "GED or alternative credential",
  "some college credit, no degree",
  "some college credit, no degree",
  "Associate's degree",
  "Bachelor's degree",
  "Master's degree",
  "Professional degree",
  "Doctorate degree")
psub$SCHL = as.factor(schlmap[psub$SCHL])
psub$SCHL = relevel(psub$SCHL,schlmap[1])
dtrain = subset(psub,ORIGRANDGROUP >= 500)  	# Note: 5 
dtest = subset(psub,ORIGRANDGROUP < 500)    	# Note: 6

# Note 1: 
#   Reencode sex from 1/2 to M/F. 

# Note 2: 
#   Make the reference sex M, so F encodes a 
#   difference from M in models. 

# Note 3: 
#   Reencode class of worker info into a more 
#   readable form. 

# Note 4: 
#   Reencode education info into a more readable 
#   form and fewer levels (merge all levels below high 
#   school into same encoding). 

# Note 5: 
#   Subset of data rows used for model 
#   training. 

# Note 6: 
#   Subset of data rows used for model 
#   testing. 

