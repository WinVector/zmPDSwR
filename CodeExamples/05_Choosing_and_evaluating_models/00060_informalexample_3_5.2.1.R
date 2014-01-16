# informalexample:3_5.2.1 
# informalexample:3 : Choosing and evaluating models : Evaluating models : Evaluating classification models 
> t <- as.table(matrix(data=c(288-1,17,1,13882-17),nrow=2,ncol=2))
> rownames(t) <- rownames(cM)
> colnames(t) <- colnames(cM)
> print(t)
         FALSE  TRUE
non-spam   287     1
spam        17 13865
