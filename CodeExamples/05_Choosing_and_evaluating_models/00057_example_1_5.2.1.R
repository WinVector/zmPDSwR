# example:1_5.2.1 
# example:1 : Choosing and evaluating models : Evaluating models : Evaluating classification models 
spamD <- read.table('spamD.tsv',header=T,sep='\t')
spamTrain <- subset(spamD,spamD$rgroup>=10)
spamTest <- subset(spamD,spamD$rgroup<10)
spamVars <- setdiff(colnames(spamD),list('rgroup','spam'))
spamFormula <- as.formula(paste('spam=="spam"',
   paste(spamVars,collapse=' + '),sep=' ~ '))
spamModel <- glm(spamFormula,family=binomial(link='logit'),
   data=spamTrain)
spamTrain$pred <- predict(spamModel,newdata=spamTrain,
   type='response')
spamTest$pred <- predict(spamModel,newdata=spamTest,
   type='response')
