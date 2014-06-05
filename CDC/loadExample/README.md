

# Example code and data for "Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014.


 * The book: ["Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014](http://www.manning.com/zumel/)  (book copyright Manning Publications Co., all rights reserved)
 * The support site: [GitHub WinVector/zmPDSwR](https://github.com/WinVector/zmPDSwR)


## The code and data in this directory supports examples from:
 * Chapter 7: Using Linear and Logistic Regression
 * Chapter 9: Exploring Advanced Methods
 * Chapter 10: Documentation and Deployment


### Our works


Procedures for preparing data.  Note: you do not need to perform any of these steps as we have saved the prepared data as ".Rdata" files in this directory.  The steps to download and load the data are not needed later in the book.

Data originally downloaded 4-25-2013 from [http://www.cdc.gov/nchs/data_access/Vitalstatsonline.htm](http://www.cdc.gov/nchs/data_access/Vitalstatsonline.htm)

 * [ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Dataset_Documentation/DVS/natality/UserGuide2010.pdf](ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Dataset_Documentation/DVS/natality/UserGuide2010.pdf)
 * Shasum: 12520b8384defc63a93fad957936fd7ee9a42ef3  UserGuide2010.pdf
 * [ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/DVS/natality/Nat2010us.zip](ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/DVS/natality/Nat2010us.zip)
 * Shasum: dad8b9fc9e8b4a4d250b7febf10d4b97350e2651  Nat2010us.zip

First uzip the data and gzip compress the DAT file that is unpacked (R is good at reading gzipped files):

```bash
  unzip Nat2010us.zip
  gzip -9 VS2010NATL.DETAILUS.DAT 
```


Define where you are taking data from (VS2010NATL.DETAILUS.DAT is a "fixed field" file where data is at specific column positions, fieldRanges.tsv is our current defintion produced by editing extractions from the data defintion PDF).

 *  fieldRanges.tsv

Define H2 database credentials:

 *  dbDef.xml

Use SQLScrewdriver to load fixed field data into a H2 database:
```bash
  java -cp SQLScrewdriver.jar:h2-1.3.170.jar -Xmx1G com.winvector.db.LoadFFF file:dbDef.xml file:fieldRanges.tsv natal file:VS2010NATL.DETAILUS.DAT.gz
```

(Note: Windows users will need to use ";" to separate classpath elements insteadl of ":".)  This produces the H2 datbase NATAL.db which we work with in R as follows:


Get at a sample of the data from R to produce natal2010Sample.tsv (which all other steps are based on).

```R
options( java.parameters = "-Xmx2g" )
library(RJDBC)
drv <- JDBC("org.h2.Driver","h2-1.3.170.jar",identifier.quote="'")
options <- ";LOG=0;CACHE_SIZE=65536;LOCK_MODE=0;UNDO_LOG=0"
conn <- dbConnect(drv,paste("jdbc:h2:NATAL",options,sep=''),"u","u")
d <- dbGetQuery(conn,"SELECT * FROM natal WHERE ORIGRANDGROUP<=10")
dbDisconnect(conn)
write.table(d,'natal2010Sample.tsv',quote=F,sep='\t',col.names=T,row.names=F)
# gzip -9 natal2010Sample.tsv
# recode 99 as unknown in APGAR5 column
```

Once we have the data sample natal2010Sample.tsv we can prepare the data for further analysis (for more up to date steps see PrepNatalRiskData.R and prepBirthWeightData.R in the parent directory).

```R
d <- read.table('natal2010Sample.tsv.gz',sep='\t',header=T,stringsAsFactors=F)
# combine rare 4-and above births with 3
d$DPLURAL = pmin(d$DPLURAL,3)
# recode unknown in outcome column
d$APGAR5[d$APGAR5==99] <- NA
# recode U as unknown in risk columns
#factorCols <- c('RF_DIAB','RF_GEST','RF_PHYP','RF_GHYP','RF_ECLAM','RF_PPTERM','RF_PPOUTC', 'CIG_REC', 'DPLURAL', 'GESTREC3', 'PRECARE_REC')
factorCols <- c('CIG_REC', 'DPLURAL', 'GESTREC3', 'PRECARE_REC')
lapply(subset(d,,select=factorCols),
   function(col) summary(as.factor(col)))
for(colName in factorCols) {
  d[,colName] <- factor(ifelse(d[,colName] %in% list('','U'),NA,d[,colName]))
}
numCols <- c('DWGT')
for(colName in numCols) {
  d[,colName] <- ifelse(d[,colName] >=999,NA,d[,colName])
}
#d$atRisk <- d$BWTR4<2 | d$APGAR5<7
d$atRisk <- d$APGAR5<7
riskCols <- c(factorCols,numCols)
library(reshape2)
dTrain <- subset(d,ORIGRANDGROUP<=5)
dTest <- subset(d,ORIGRANDGROUP>5)
model <- glm(as.formula(paste('atRisk',paste(riskCols,collapse=' + '),sep=' ~ ')),
  data=dTrain,family=binomial(link='logit'))   
print(summary(model))
dTest$pred <- predict(model,newdata=dTest,type='response')
dplot <- subset(dTest,(!is.na(pred) & (!is.na(atRisk))))
ambientProb <- mean(dplot$atRisk)
table(pred=dplot$pred>=2*ambientProb,atRisk=dplot$atRisk)
```



## License for our additional documentation, notes, code, and example data: 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

No guarantee, indemnification or claim of fitness is made regarding any of these items.

No claim of license on works of others or derived data.
