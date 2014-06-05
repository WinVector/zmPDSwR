
# Data from 2011 ACS 1-year PUMS fields American Community Survey

This is an example how to load the Census data used in the book.  We have the data pre-prepared [here](https://github.com/WinVector/zmPDSwR/blob/master/PUMS/phsample.RData) so you do not need to perform any of these steps unless you want to learn about SQLscrewdriver (not a requirement for later exercises in the book).

Original data is not included here for reasons of license and size.

To download data:

 * Go to original Census link [http://www.census.gov/acs/www/data_documentation/pums_data/](http://www.census.gov/acs/www/data_documentation/pums_data/)
 * Navigate to [2011 ACS 1-year PUMS](http://factfinder2.census.gov/bkmk/navigation/1.0/en/d_dataset:ACS_11_1YR/d_product_type:PUMS)
 * Dowload [2011 ACS 1-year Public Use Microdata Samples (PUMS) - CSV format](http://factfinder2.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_pums_csv_2011&prodType=document)
 * Download [United States Population Records](http://www2.census.gov/acs2011_1yr/pums/csv_pus.zip) as csv_pus.zip and [United States Housing Unit Records](http://www2.census.gov/acs2011_1yr/pums/csv_hus.zip) as csv_hus.zip.
 * Unzip csv_pus.zip and csv_hus.zip.  The data you want is:
    * csv_hus/ss11husa.csv
    * csv_hus/ss11husb.csv
    * csv_pus/ss11pusa.csv
    * csv_pus/ss11pusb.csv

Leave data in these directories and one directory above csv_hus and csv_pus run the following at the command line:


```
java -classpath SQLScrewdriver.jar:h2-1.3.170.jar \
   com.winvector.db.LoadFiles \
   file:dbDef.xml , hus \
   file:csv_hus/ss11husa.csv file:csv_hus/ss11husb.csv
java -classpath SQLScrewdriver.jar:h2-1.3.170.jar \
   com.winvector.db.LoadFiles \
   file:dbDef.xml , pus \
   file:csv_pus/ss11pusa.csv file:csv_pus/ss11pusb.csv
```

The jars SQLScrewdriver.jar h2-1.3.170.jar are available [here](https://github.com/WinVector/zmPDSwR/tree/master/PUMS/loadExample).  Note: Windows users should use ";" to sparate jars instead of ":".

Where the XML file dbDef.xml is:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
 <comment>testdb</comment>
 <entry key="user">u</entry>
 <entry key="password">u</entry>
 <entry key="driver">org.h2.Driver</entry>
 <entry key="url">jdbc:h2:H2DB \
  ;LOG=0;CACHE_SIZE=65536;LOCK_MODE=0;UNDO_LOG=0</entry>
</properties>
```

And the follow-up R commands are:

```
options( java.parameters = "-Xmx2g" )
library(RJDBC)
drv = JDBC("org.h2.Driver","h2-1.3.170.jar",identifier.quote="'")
options=";LOG=0;CACHE_SIZE=65536;LOCK_MODE=0;UNDO_LOG=0"
conn = dbConnect(drv,paste("jdbc:h2:H2DB",options,sep=''),"u","u")
dhus = dbGetQuery(conn,"SELECT * FROM hus WHERE ORIGRANDGROUP<=1")
dpus = dbGetQuery(conn,"SELECT pus.* FROM pus WHERE pus.SERIALNO IN \
(SELECT DISTINCT hus.SERIALNO FROM hus WHERE hus.ORIGRANDGROUP<=1)")
dbDisconnect(conn)
save(dhus,dpus,file='phsample.RData')
```

This produces phsample.RData (a already prepared copy of which is available [here](https://github.com/WinVector/zmPDSwR/tree/master/PUMS), so you can skip all of the above steps).
Data can then be loaded with:

```
load('phsample.RData')
```

This loads dhus (2982 random households) and dpus (6279 personal records
joined with the households from dhus).

# Note on downloading files

A remote source could update files at any time (and even worse they may change links).  The data we used in this book had the following cryptographic hashses (downloaded in March and February and 2013, and also matching on a June 4 2014 download):

 * csv_hus.zip  shasum: cdfdfb326956e202fdb560ee34471339ac8abd6c
 * csv_pus.zip  shasum: aa0f4add21e327b96d9898b850e618aeca10f6d0
 * csv_hus/ss11husa.csv  shasum: 72a0212e8313af83354460af1daeb54a7321f429
 * csv_hus/ss11husb.csv  shasum: 1edaedb79f7766a9712fc0a8a7b674e427e5ba56
 * csv_pus/ss11pusa.csv  shasum: 574d657d2094087722a054e3c16c277ece34f01c
 * csv_pus/ss11pusb.csv  shasum: 89a6401524e2f25e02633849828462fa1204ea91



