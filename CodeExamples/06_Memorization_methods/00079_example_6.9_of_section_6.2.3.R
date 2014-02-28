# example 6.9 of section 6.2.3 
# (example 6.9 of section 6.2.3)  : Memorization methods : Building single-variable models : Using cross-validation to estimate effects of overfitting 
# Title: Running a repeated cross-validation experiment 

> var <- 'Var217'
> aucs <- rep(0,100)
> for(rep in 1:length(aucs)) {   	# Note: 1 
   useForCalRep <- rbinom(n=dim(dTrainAll)[[1]],size=1,prob=0.1)>0  	# Note: 2 
   predRep <- mkPredC(dTrainAll[!useForCalRep,outcome],  	# Note: 3 
      dTrainAll[!useForCalRep,var],
      dTrainAll[useForCalRep,var])
   aucs[rep] <- calcAUC(predRep,dTrainAll[useForCalRep,outcome])  	# Note: 4 
 }
> mean(aucs)
[1] 0.5556656
> sd(aucs)
[1] 0.01569345

# Note 1: 
#   For 100 iterations... 

# Note 2: 
#   ...select a random subset of about 10% of the training data as hold-out set,... 

# Note 3: 
#   ...use the random 90% of training data to train model and evaluate that model on hold-out 
#   set,... 

# Note 4: 
#   ...calculate resulting model’s AUC using hold-out set; store that value and repeat. 

