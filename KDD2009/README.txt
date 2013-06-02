
6-2-2013
Data from: http://www.sigkdd.org/kdd-cup-2009-customer-relationship-prediction
Downloaded:
$ shasum *
	e43a38e3477e38b354943519954b719ec7623c2f  orange_small_train.data.zip
	8274d23235630717659898900b7f74092ff339ad  orange_small_train_appetency.labels.txt
	ec2de79844657fb892ec9047e6304c12b296ff68  orange_small_train_churn.labels.txt
	4cd2d7c9b20fd3638883a91a2fed6a03a4d5d015  orange_small_train_upselling.labels.txt

Load data:
```bash
  unzip orange_small_train.data.zip
  gzip -9 orange_small_train.data
```

in R:
```
d <- read.table('orange_small_train.data.gz',
header=T,sep='\t',na.strings=c('NA',''))
churn <- read.table('orange_small_train_churn.labels.txt',
   header=F,sep='\t')
d$churn <- churn$V1
appetency <- read.table('orange_small_train_appetency.labels.txt',
   header=F,sep='\t')
d$appetency <- appetency$V1
upselling <- read.table('orange_small_train_upselling.labels.txt',
   header=F,sep='\t')
d$upselling <- upselling$V1
set.seed(729375)
d$rgroup <- runif(dim(d)[[1]])
dTrain <- subset(d,rgroup<=0.9)
dTest <- subset(d,rgroup>0.9)
rm(list=c('d','churn','appetency','upselling'))
```

 
ad-hoc modeling
```R
utcomes <- c('churn','appetency','upselling')
ars <- setdiff(colnames(dTrain),
   c(outcomes,'rgroup'))
isGoodVar <- function(x) {
  nonNaRate <- sum(!is.na(x))/length(x)
  if(nonNaRate<0.8) {
     F
  } else {
     if( (class(x)=='factor') | (class(x)=='character') ) {
       nLevels <- sum(!is.na(unique(x)))
       nLevels>1 & nLevels<=20
     } else {
       var(x,na.rm=T)>0
     }
  }
}
goodVar <- sapply(vars,function(v) {isGoodVar(dTrain[,v])})
dTrain <-  subset(dTrain,complete.cases(dTrain[,c(vars[goodVar],outcomes)]))
dTest <-  subset(dTest,complete.cases(dTest[,c(vars[goodVar],outcomes)]))

outcome='churn'

catVars <- vars[goodVar & ((sapply(dTrain[,vars],class)=='factor') | (sapply(dTrain[,vars],class)=='character'))]


for(v in catVars) {
  x <- dTrain[,v]
  if( (class(x)=='factor') | (class(x)=='character') ) {
    fi <- as.formula(paste(outcome,'>0 ~ ',v,sep=''))
    mi <- glm(fi,data=dTrain,family=binomial(link='logit'))
    di <- summary(mi)$deviance
    print(paste(v,di))
  }
}
composite <- c('Var205','Var221','Var227')
dTrain$composite <- do.call(paste,as.list(dTrain[,composite]))
dTest$composite <- do.call(paste,as.list(dTest[,composite]))
trainTable <- table(dTrain[,outcome]>0,dTrain$composite)
predTable <- trainTable[2,]/(trainTable[1,]+trainTable[2,])
dTest$pred <- predTable[dTest$composite]

 f <- as.formula(paste(outcome,'>0 ~ ',paste(vars[goodVar],collapse=' + '),sep=''))

# model <- glm(f,data=dTrain,family=binomial(link='logit'))
# dTrain$pred <- predict(model,newdata=dTrain,type='response')
# dTest$pred <- predict(model,newdata=dTest,type='response')
# 0.65

library('rpart')
model <- rpart(f,data=dTrain,control=rpart.control(cp=0.001))
dTrain$pred <- predict(model,newdata=dTrain)
dTest$pred <- predict(model,newdata=dTest)
# 0.60

library('ROCR')
pred <- prediction(dTest$pred,dTest[,outcome]>0)
perf <- performance(pred,'auc')
as.numeric(perf@y.values)


library('ggplot2')
dTest$outcome = dTest[,outcome]>0
ggplot(data=dTest) + geom_density(aes(x=pred,color=outcome))


library('randomForest')
model <- randomForest(f,data=dTrain)
dTrain$pred <- predict(model,newdata=dTrain)
dTest$pred <- predict(model,newdata=dTest)
```
