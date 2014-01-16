# informalexample:2_10.2.3 
# informalexample:2 : Documentation and Deployment : Using knitr to produce milestone documentation : Using knitr to document the buzz data 

<<dataprep,tidy=F,cache=T>>=
infile <- "TomsHardware-Relative-Sigma-500.data.txt"
paste('checked at',date())
system(paste('shasum',infile),intern=T)  # write down file hash
buzzdata <- read.table(infile, header=F, sep=",")
...

