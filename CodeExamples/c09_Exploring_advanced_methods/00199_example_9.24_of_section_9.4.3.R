# example 9.24 of section 9.4.3 
# (example 9.24 of section 9.4.3)  : Exploring advanced methods : Using SVMs to model complicated decision boundaries : Using SVMs on real data 
# Title: Revisiting the Spambase example with GLM 

spamD <- read.table('spamD.tsv',header=T,sep='\t')
spamTrain <- subset(spamD,spamD$rgroup>=10)
spamTest <- subset(spamD,spamD$rgroup<10)
spamVars <- setdiff(colnames(spamD),list('rgroup','spam'))
spamFormula <- as.formula(paste('spam=="spam"',
   paste(spamVars,collapse=' + '),sep=' ~ '))
spamModel <- glm(spamFormula,family=binomial(link='logit'),
   data=spamTrain)
spamTest$pred <- predict(spamModel,newdata=spamTest,
   type='response')
print(with(spamTest,table(y=spam,glPred=pred>=0.5)))
##           glPred
## y          FALSE TRUE
##   non-spam   264   14
##   spam        22  158

