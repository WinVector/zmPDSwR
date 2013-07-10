
6-2-2013
Data from: http://www.sigkdd.org/kdd-cup-2009-customer-relationship-prediction
Downloaded:
$ shasum *
	e43a38e3477e38b354943519954b719ec7623c2f  orange_small_train.data.zip
	8274d23235630717659898900b7f74092ff339ad  orange_small_train_appetency.labels.txt
	ec2de79844657fb892ec9047e6304c12b296ff68  orange_small_train_churn.labels.txt
	4cd2d7c9b20fd3638883a91a2fed6a03a4d5d015  orange_small_train_upselling.labels.txt
Data to support examples in the chapter on memorization methods in "Practical Data Science with R" ( http://www.manning.com/zumel/ ).

Load data:
```bash
  unzip orange_small_train.data.zip
  gzip -9 orange_small_train.data
```


To prepare data in R:
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
dTrainAll <- subset(d,rgroup<=0.9)
dTest <- subset(d,rgroup>0.9)
rm(list=c('d','churn','appetency','upselling'))
outcomes <- c('churn','appetency','upselling')
vars <- setdiff(colnames(dTrainAll),
   c(outcomes,'rgroup'))
numericVars <- vars[sapply(dTrainAll[,vars],class) %in% c('numeric','integer')]
catVars <- vars[sapply(dTrainAll[,vars],class) %in% c('factor','character')]
useForCal <- rbinom(n=dim(dTrainAll)[[1]],size=1,prob=0.1)>0
dCal <- subset(dTrainAll,useForCal)
dTrain <- subset(dTrainAll,!useForCal)
outcome <- 'churn'
pos <- '1'
```
 
example modeling:
```R
mkPredC <- function(outCol,varCol,appCol) {
   pPos <- sum(outCol==pos)/length(outCol)
   naTab <- table(as.factor(outCol[is.na(varCol)]))
   pPosWna <- (naTab/sum(naTab))[pos]
   vTab <- table(as.factor(outCol),varCol)
   pPosWv <- (vTab[pos,]+1.0e-3*pPos)/(colSums(vTab)+1.0e-3)
   pred <- pPosWv[appCol]
   pred[is.na(appCol)] <- pPosWna
   pred[is.na(pred)] <- pPos
   pred
}

for(v in catVars) {
  pi <- paste('pred',v,sep='')
  dTrain[,pi] <- mkPredC(dTrain[,outcome],dTrain[,v],dTrain[,v])
  dTest[,pi] <- mkPredC(dTrain[,outcome],dTrain[,v],dTest[,v])
  dCal[,pi] <- mkPredC(dTrain[,outcome],dTrain[,v],dCal[,v])
}




mkPredNcat <- function(outCol,varCol,appCol) {
   cuts <- unique(as.numeric(quantile(varCol,probs=seq(0, 1, 0.1),na.rm=T)))
   varC <- cut(varCol,cuts)
   appC <- cut(appCol,cuts)
   mkPredC(outCol,varC,appC)
}




mkPredN <- mkPredNcat
#> print(paste('train',as.numeric(perfTrain@y.values)))
#[1] "train 0.733887878767371"
#> print(paste('cal',as.numeric(perfCal@y.values)))
#[1] "cal 0.71792789642535"
#> print(paste('test',as.numeric(perfTest@y.values)))
#[1] "test 0.726387559207025"


for(v in numericVars) {
  pi <- paste('pred',v,sep='')
  dTrain[,pi] <- mkPredN(dTrain[,outcome],dTrain[,v],dTrain[,v])
  dTest[,pi] <- mkPredN(dTrain[,outcome],dTrain[,v],dTest[,v])
  dCal[,pi] <- mkPredN(dTrain[,outcome],dTrain[,v],dCal[,v])
}

logLikelyhood <- function(outCol,predCol) {
  sum(ifelse(outCol==pos,log(predCol),log(1-predCol)))
}

entropy <- function(x) { 
  xpos <- x[x>0 & !is.na(x)]
  scaled <- xpos/sum(xpos)
  sum(-scaled*log(scaled,2))
}

nPos <- sum(dTrain[,outcome]==pos)
pPos <- nPos/length(dTrain[,outcome])
eps <- 1.0e-5
for(v in c(catVars,numericVars)) {
  pi <- paste('pred',v,sep='')
  li <- paste('lift',v,sep='')
  dTrain[,li] <- log((dTrain[,pi]+eps)/(pPos+eps))
  dTest[,li] <- log((dTest[,pi]+eps)/(pPos+eps))
  dCal[,li] <- log((dCal[,pi]+eps)/(pPos+eps))
}


library('ROCR')

selVars <- c()
minStep <- 5

baseRateTrain <- logLikelyhood(dTrain[,outcome],sum(dTrain[,outcome]==pos)/length(dTrain[,outcome]))
baseRateCheck <- logLikelyhood(dCal[,outcome],sum(dCal[,outcome]==pos)/length(dCal[,outcome]))
for(v in catVars) {
  pi <- paste('pred',v,sep='')
  li <- paste('lift',v,sep='')
  liTrain <- 2*(logLikelyhood(dTrain[,outcome],dTrain[,pi])- baseRateTrain - 2^entropy(table(dTrain[,pi],useNA='ifany')))
  liCheck <- 2*(logLikelyhood(dCal[,outcome],dCal[,pi]) - baseRateCheck - 2^entropy(table(dCal[,pi],useNA='ifany')))
  if((liTrain>=minStep)&(liCheck>minStep)) {
     print(sprintf("%s, trainAIC: %g calibrationAIC: %g",
        pi,liTrain,liCheck))
    selVars <- c(selVars,li)
  }
}
print(selVars)
for(v in numericVars) {
  pi <- paste('pred',v,sep='')
  li <- paste('lift',v,sep='')
  liTrain <- 2*(logLikelyhood(dTrain[,outcome],dTrain[,pi])-baseRateTrain-1)
  liCheck <- 2*(logLikelyhood(dCal[,outcome],dCal[,pi])-baseRateCheck-1)
  if((liTrain>=minStep) && (liCheck>=minStep)) {
     print(sprintf("%s, trainAIC: %g calibrationAIC: %g",
        pi,liTrain,liCheck))
     selVars <- c(selVars,li)
  }
}
print(selVars)


f <- paste(outcome,'>0 ~ ',paste(selVars,collapse=' + '),sep='')
# note, actually the glm() just wants the conditionals not the joints as inputs
# but that is just a matter of dividing by pPos, so it can compensate in the linear
# coefficient
model <- glm(as.formula(f),data=dTrain,family=binomial(link='logit'))
print(summary(model))
# could use stepwise regression at this point
dTrain$pred <- predict(model,type='response',newdata=dTrain)
dCal$pred <- predict(model,type='response',newdata=dCal)
dTest$pred <- predict(model,type='response',newdata=dTest)


perfTrain <- performance(prediction(dTrain$pred,dTrain[,outcome]>0),'auc')
perfCal <- performance(prediction(dCal$pred,dCal[,outcome]>0),'auc')
perfTest <- performance(prediction(dTest$pred,dTest[,outcome]>0),'auc')
print(paste('train',as.numeric(perfTrain@y.values)))
print(paste('cal',as.numeric(perfCal@y.values)))
print(paste('test',as.numeric(perfTest@y.values)))


modelRateTrain <- logLikelyhood(dTrain[,outcome],dTrain$pred)
modelRateCal <- logLikelyhood(dCal[,outcome],dCal$pred)
modelRateTest <- logLikelyhood(dTest[,outcome],dTest$pred)


library('ggplot2')

# show one of the "better" factors
ggplot(data=dTrain) + geom_density(aes(x=predVar218,color=as.factor(churn)))
ggplot(data=dTest) + geom_density(aes(x=predVar218,color=as.factor(churn)))

# show one of the "better" numeric predictions
ggplot(data=dTrain) + geom_density(aes(x=predVar126,color=as.factor(churn)))
ggplot(data=dTest) + geom_density(aes(x=predVar126,color=as.factor(churn)))


# show the model
ggplot(data=dTrain) + geom_density(aes(x=pred,color=as.factor(churn)))
ggplot(data=dTest) + geom_density(aes(x=pred,color=as.factor(churn)))

# save(list=ls(),file='KDDSteps.RData')

calcAUC <- function(predcol,outcol) {
   perf <- performance(prediction(predcol,outcol==pos),'auc')
   as.numeric(perf@y.values)
}


library('rpart')
tmodel <- rpart(f,data=dTrain,control=rpart.control(cp=0.001))
dTrain$tpred <- predict(tmodel,newdata=dTrain)
dCal$tpred <- predict(tmodel,newdata=dCal)
dTest$tpred <- predict(tmodel,newdata=dTest)
calcAUC(dTrain$tpred,dTrain[,outcome])
# [1] 0.6936439
calcAUC(dTest$tpred,dTest[,outcome])
# [1] 0.6785368
calcAUC(dCal$tpred,dCal[,outcome])
# [1] 0.6780398




# AUCs by training
for(v in catVars) {
  pi <- paste('pred',v,sep='')
  aucTrain <- calcAUC(dTrain[,pi],dTrain[,outcome])
  if(aucTrain>=0.8) {
     aucCal <- calcAUC(dCal[,pi],dCal[,outcome])
     print(sprintf("%s, trainAUC: %4.3f calibrationAUC: %4.3f",
       pi,aucTrain,aucCal))
  }
}
# AUCs by calibration
for(v in catVars) {
  pi <- paste('pred',v,sep='')
  aucTrain <- calcAUC(dTrain[,pi],dTrain[,outcome])
  aucCal <- calcAUC(dCal[,pi],dCal[,outcome])
  if(aucCal>=0.59) {
     print(sprintf("%s, trainAUC: %4.3f calibrationAUC: %4.3f",
       pi,aucTrain,aucCal))
  }
}

for(v in numericVars) {
  pi <- paste('pred',v,sep='')
  aucTrain <- calcAUC(dTrain[,pi],dTrain[,outcome])
  if(aucTrain>=0.8) {
     aucCal <- calcAUC(dCal[,pi],dCal[,outcome])
     print(sprintf("%s, trainAUC: %4.3f calibrationAUC: %4.3f",
       pi,aucTrain,aucCal))
  }
}



library('randomForest')
fmodel <- randomForest(as.formula(f),data=dTrain,ntree=100,maxnodes=50,type='classification')
dTrain$fpred <- predict(fmodel,newdata=dTrain)
dTest$fpred <- predict(fmodel,newdata=dTest)
dCal$fpred <- predict(fmodel,newdata=dCal)
calcAUC(dTrain$fpred,dTrain[,outcome])
#[1] 0.7501219
calcAUC(dTest$fpred,dTest[,outcome])
# [1] 0.717073
calcAUC(dCal$fpred,dCal[,outcome])
# [1] 0.7109103



# better AUC estimate
var <- 'Var217'
aucs <- rep(0,100)
for(rep in 1:length(aucs)) {
   useForCalRep <- rbinom(n=dim(dTrainAll)[[1]],size=1,prob=0.1)>0
   predRep <- mkPredC(dTrainAll[!useForCalRep,outcome],
      dTrainAll[!useForCalRep,var],
      dTrainAll[useForCalRep,var])
   aucs[rep] <- calcAUC(predRep,dTrainAll[useForCalRep,outcome])
}
mean(aucs)
# [1] 0.5556656
#print(aucs)
#ggplot() + geom_density(aes(x=aucs))
```
