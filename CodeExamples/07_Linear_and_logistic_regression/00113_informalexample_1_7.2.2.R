# informalexample:1_7.2.2 
# informalexample:1 : Linear and logistic regression : Using logistic regression : Building a logistic regression model 
complications <- c("ULD_MECO","ULD_PRECIP","ULD_BREECH")
 riskfactors <- c("URF_DIAB", "URF_CHYPER", "URF_PHYPER",
                "URF_ECLAM")
y <- "atRisk"
x <- c("PWGT",
      "UPREVIS",
      "CIG_REC",
      "GESTREC3",
      "DPLURAL",
      complications,
      riskfactors)
fmla <- paste(y, paste(x, collapse="+"), sep="~")
