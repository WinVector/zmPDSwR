
2-20-2013

Data from.
2011 ACS 1-year PUMS fields American Community Survey

load('phsample.RData')

loads dhus (2982 random households) and dpus (6279 personal records
joined with the households from dhus).





this was produced using SQL screwdriver (currently described in ch2)
with the commands:

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

java -classpath SQLScrewdriver.jar:h2-1.3.170.jar \
   com.winvector.db.LoadFiles \
   file:dbDef.xml , hus \
   file:csv_hus/ss11husa.csv file:csv_hus/ss11husb.csv
java -classpath SQLScrewdriver.jar:h2-1.3.170.jar \
   com.winvector.db.LoadFiles \
   file:dbDef.xml , pus \
   file:csv_pus/ss11pusa.csv file:csv_pus/ss11pusb.csv

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
