# informalexample:2_6.2.3 
# informalexample:2 : Memorization methods : Building single-variable models : Using cross-validation to estimate effects of overfitting 
> fCross <- function() {
   useForCalRep <- rbinom(n=dim(dTrainAll)[[1]],size=1,prob=0.1)>0
   predRep <- mkPredC(dTrainAll[!useForCalRep,outcome],
      dTrainAll[!useForCalRep,var],
      dTrainAll[useForCalRep,var])
   calcAUC(predRep,dTrainAll[useForCalRep,outcome])
}
> aucs <- replicate(100,fCross())
