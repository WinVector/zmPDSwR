
4-26-2013
Data from http://archive.ics.uci.edu/ml/datasets/Spambase
Data file is: http://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data
```bash
$ shasum spambase.data 
e28aa2a7d4592b4f5f71347912c1b4b759336b58  spambase.data
```

Data preparation steps:

```R
spamD <- read.table('http://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data',sep=',',header=F)
spamCols <- c(
   'word.freq.make', 'word.freq.address', 'word.freq.all',
   'word.freq.3d', 'word.freq.our', 'word.freq.over', 'word.freq.remove',
   'word.freq.internet', 'word.freq.order', 'word.freq.mail',
   'word.freq.receive', 'word.freq.will', 'word.freq.people',
   'word.freq.report', 'word.freq.addresses', 'word.freq.free',
   'word.freq.business', 'word.freq.email', 'word.freq.you',
   'word.freq.credit', 'word.freq.your', 'word.freq.font',
   'word.freq.000', 'word.freq.money', 'word.freq.hp', 'word.freq.hpl',
   'word.freq.george', 'word.freq.650', 'word.freq.lab',
   'word.freq.labs', 'word.freq.telnet', 'word.freq.857',
   'word.freq.data', 'word.freq.415', 'word.freq.85',
   'word.freq.technology', 'word.freq.1999', 'word.freq.parts',
   'word.freq.pm', 'word.freq.direct', 'word.freq.cs',
   'word.freq.meeting', 'word.freq.original', 'word.freq.project',
   'word.freq.re', 'word.freq.edu', 'word.freq.table',
   'word.freq.conference', 'char.freq.semi', 'char.freq.lparen',
   'char.freq.lbrack', 'char.freq.bang', 'char.freq.dollar',
   'char.freq.hash', 'capital.run.length.average',
   'capital.run.length.longest', 'capital.run.length.total',
   'spam'
)
colnames(spamD) <- spamCols
spamD$spam <- as.factor(ifelse(spamD$spam>0.5,'spam','non-spam'))
set.seed(2350290)
spamD$rgroup <- floor(100*runif(dim(spamD)[[1]]))
#write.table(spamD,file='spamD.tsv',quote=F,sep='\t',row.names=F)
```

Analysis steps, download https://raw.github.com/WinVector/zmPDSwR/master/Spambase/spamD.tsv

```R
spamD <- read.table('spamD.tsv',header=T,sep='\t')
spamTrain <- subset(spamD,spamD$rgroup>=10)
spamTest <- subset(spamD,spamD$rgroup<10)
spamVars <- setdiff(colnames(spamD),list('rgroup','spam'))
spamFormula <- as.formula(paste('spam=="spam"',
   paste(spamVars,collapse=' + '),sep=' ~ '))
spamModel <- glm(spamFormula,family=binomial(link='logit'),
   data=spamTrain)
spamTrain$pred <- predict(spamModel,newdata=spamTrain,type='response')
spamTest$pred <- predict(spamModel,newdata=spamTest,type='response')

trainSpamTable <- table(truth=spamTrain$spam,
   prediction=spamTrain$pred>0.5)
testSpamTable <- table(truth=spamTest$spam,
   prediction=spamTest$pred>0.5)
# sort(sample(1:(dim(spamTest)[[1]]),size=4,replace=F))
# [1]   7  35 224 327
sample <- spamTest[c(7,35,224,327),c('spam','pred')]
cM <- table(truth=spamTest$spam,prediction=spamTest$pred>0.5)
(cM[1,1]+cM[2,2])/sum(cM)
cM[2,2]/(cM[2,2]+cM[1,2])
cM[2,2]/(cM[2,2]+cM[2,1])
cM[1,1]/(cM[1,1]+cM[1,2])
t <- as.table(matrix(data=c(288-1,17,1,13882-17),nrow=2,ncol=2))
rownames(t) <- rownames(cM)
colnames(t) <- colnames(cM)
(t[1,1]+t[2,2])/sum(t)
t[2,2]/(t[2,2]+t[1,2])
t[2,2]/(t[2,2]+t[2,1])
t[1,1]/(t[1,1]+t[1,2])
# ROC curve
library('ROCR')
eval <- prediction(spamTest$pred,spamTest$spam)
plot(performance(eval,"tpr","fpr"))
# AUC
attributes(performance(eval,'auc'))$y.values[[1]]
```

