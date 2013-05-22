## Support files for zmPDSwR

Works derived from others (data sets) remain controlled by them.  We are distributing as these parties have allowed and not making any claim or grant of additional rights or license.

Work we have created (scripts) is licensed under a [Creative Commons Attribution-NonCommercial 3.0 Unported License] [by-nc].

No guarantee, indemnification or claim of fitness is made regarding any of these items.


### License: 

[![Creative Commons License](http://i.creativecommons.org/l/by-nc/3.0/88x31.png)] [by-nc]  
This work is licensed under a [Creative Commons Attribution-NonCommercial 3.0 Unported License] [by-nc].



### Our works ([Creative Commons Attribution-NonCommercial 3.0 Unported License] [by-nc]):

Procedures for getting data (still in progress).

Data originally downloaded 4-25-2013 from http://www.cdc.gov/nchs/data_access/Vitalstatsonline.htm
* ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Dataset_Documentation/DVS/natality/UserGuide2010.pdf
* Shasum: 12520b8384defc63a93fad957936fd7ee9a42ef3  UserGuide2010.pdf
* ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/DVS/natality/Nat2010us.zip
* Shasum: dad8b9fc9e8b4a4d250b7febf10d4b97350e2651  Nat2010us.zip

get at data
```bash
  unzip Nat2010us.zip
  gzip -9 VS2010NATL.DETAILUS.DAT 
```

Extract fixed field defs from UserGuide2010.pdf (still need to be checked and editted):
*  fieldRanges.tsv

Define H2 database credentials:
*  dbDef.xml

Use SQLScrewdriver to load fixed field data into a H2 database:
```bash
  java -cp SQLScrewdriver.jar:h2-1.3.170.jar -Xmx1G com.winvector.db.LoadFFF file:dbDef.xml file:fieldRanges.tsv natal file:VS2010NATL.DETAILUS.DAT.gz
```

Get at a sample of the data from R:
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
  # d <- read.table('natal2010Sample.tsv.gz',sep='\t',header=T)
```


### Works by others (no claim of license here):

* UserGuide2010.pdf : ( CDC supplied data user guide )


### Derived works (no claim of license here):

* fieldRanges.tsv : (derived from CDC documentation, needs editing).
* natal2010Sample.tsv.gz : uniform sample of CDC 2010 natality data (work in progress).


  [by-nc]: http://creativecommons.org/licenses/by-nc/3.0/ "Attribution-NonCommercial 3.0 Unported (CC BY-NC 3.0)"