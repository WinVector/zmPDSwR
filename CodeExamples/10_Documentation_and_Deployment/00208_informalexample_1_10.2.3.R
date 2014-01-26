# informalexample:1_10.2.3 
# informalexample:1 : Documentation and deployment : Using knitr to produce milestone documentation : Using knitr to document the buzz data 
% set up caching and knitr chunk dependency calculation
% note: you will want to do clean re-runs once in a while to make sure
% you are not seeing stale cache results.
<<setup,tidy=F,cache=F,eval=T,echo=F,results='hide'>>=
opts_chunk$set(autodep=T)
dep_auto()
@
