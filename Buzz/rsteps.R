buzzdata = read.table("TomsHardware-Relative-Sigma-500.data.txt", 
                      header=F, sep=",")

makevars = function(colname, ndays=7) {
  paste(colname, 0:ndays, sep='')
}

varnames = c("num.new.disc",
             "burstiness",
             "number.total.disc",
             "auth.increase",
             "atomic.containers", # ?
             "num.displays", # number of times topic displayed to user (measure of interest)
             "contribution.sparseness", # ?
             "avg.auths.per.disc",
             "num.authors.topic", # total authors on the topic
             "avg.disc.length",
             "attention.level.author",
             "attention.level.contrib"
)

colnames = as.vector(sapply(varnames, FUN=makevars))
colnames =  c(colnames, "buzz")
colnames(buzzdata) = colnames

# Split into training and test
set.seed(2362690L)
rgroup = runif(dim(buzzdata)[1])
buzztrain = buzzdata[rgroup > 0.1,]
buzztest = buzzdata[rgroup <=0.1,]
