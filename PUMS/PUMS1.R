
# load('phsample.RData')
# build indicator for a very restricted subset
dpus$stdworker <- with(dpus,(PINCP>1000)&(ESR==1)&
   (PINCP<=250000)&(PERNP>1000)&(PERNP<=250000)&
   (WKHP>=40)&(AGEP>=20)&(AGEP<=50)&
   (PWGTP1>0)&(COW %in% (1:7))&(SCHL %in% (1:24)))
# fix up factors
dpus$SEX <- as.factor(ifelse(dpus$SEX==1,'M','F'))
dpus$SEX <- relevel(dpus$SEX,'M')
cowmap <- c("Employee of a private for-profit",
   "Private not-for-profit employee",
   "Local government employee",
   "State government employee",
   "Federal government employee",
   "Self-employed not incorporated",
   "Self-employed incorporated")
dpus$COW <- as.factor(cowmap[dpus$COW])
dpus$COW <- relevel(dpus$COW,cowmap[1])
schlmap <- c(
   rep("no high school diploma",15),
  "Regular high school diploma",
  "GED or alternative credential",
  "some college credit, no degree",
  "some college credit, no degree",
  "Associate's degree",
  "Bachelor's degree",
  "Master's degree",
  "Professional degree",
  "Doctorate degree")
dpus$SCHL <- as.factor(schlmap[dpus$SCHL])
dpus$SCHL <- relevel(dpus$SCHL,schlmap[1])
# get a very restricted subset
psub <- subset(dpus,dpus$stdworker)

