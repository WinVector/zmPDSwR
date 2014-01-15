# example:1_6.1.1 
# example:1 : Memorization methods : KDD and the 2009 KDD cup : Getting started with the KDD 2009 data 
d <- read.table('orange_small_train.data.gz',  	# Note: 1 
   header=T,
   sep='\t',
   na.strings=c('NA','')) 	# Note: 2 
churn <- read.table('orange_small_train_churn.labels.txt',
   header=F,sep='\t') 	# Note: 3 
d$churn <- churn$V1 	# Note: 4 
appetency <- read.table('orange_small_train_appetency.labels.txt',
   header=F,sep='\t')
d$appetency <- appetency$V1 	# Note: 5 
upselling <- read.table('orange_small_train_upselling.labels.txt',
   header=F,sep='\t')
d$upselling <- upselling$V1 	# Note: 6 
set.seed(729375)
d$rgroup <- runif(dim(d)[[1]])
dTrainAll <- subset(d,rgroup<=0.9)
dTest <- subset(d,rgroup>0.9) 	# Note: 7 
outcomes=c('churn','appetency','upselling')
vars <- setdiff(colnames(dTrainAll),
   c(outcomes,'rgroup'))
catVars <- vars[sapply(dTrainAll[,vars],class) %in%
   c('factor','character')] 	# Note: 8 
numericVars <- vars[sapply(dTrainAll[,vars],class) %in%
   c('numeric','integer')] 	# Note: 9 
rm(list=c('d','churn','appetency','upselling')) 	# Note: 10 
outcome <- 'churn' 	# Note: 11 
pos <- '1' 	# Note: 12 
useForCal <- rbinom(n=dim(dTrainAll)[[1]],size=1,prob=0.1)>0 	# Note: 13 
dCal <- subset(dTrainAll,useForCal)
dTrain <- subset(dTrainAll,!useForCal)


# Note 1: 
#   Read the file of 
#   independent variables. All data from 
#   https://github.com/WinVector/zmPDSwR/tree/master/KDD2009 

# Note 2: 
#   Treat both NA and the 
#   empty string as missing data 

# Note 3: 
#   Read churn dependent 
#   variable 

# Note 4: 
#   Add churn as 
#   a new column 

# Note 5: 
#   Add appetency as 
#   a new column 

# Note 6: 
#   Add upselling as 
#   a new column 

# Note 7: 
#   Split data into 
#   train and test subsets 

# Note 8: 
#   Identify which 
#   features are categorical variables 

# Note 9: 
#   Identify which 
#   features are numeric variables 

# Note 10: 
#   Remove unneeded objects 
#   from workspace 

# Note 11: 
#   Choose which 
#   outcome to model (churn) 

# Note 12: 
#   Choose which 
#   outcome is considered positive 

# Note 13: 
#   Further split 
#   training data into training and 
#   calibration 
