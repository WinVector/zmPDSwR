# example 2.11 of section 2.2.2 
# (example 2.11 of section 2.2.2)  : Loading data into R : Working with relational databases : Loading data from a database into R 
# Title: Loading data into R from a relational database 

options( java.parameters = "-Xmx2g" )  	# Note: 1 
library(RJDBC)
drv <- JDBC("org.h2.Driver", 	# Note: 2 
   "h2-1.3.170.jar", 	# Note: 3 
   identifier.quote="'") 	# Note: 4 
options<-";LOG=0;CACHE_SIZE=65536;LOCK_MODE=0;UNDO_LOG=0"
conn <- dbConnect(drv,paste("jdbc:h2:H2DB",options,sep=''),"u","u")
dhus <- dbGetQuery(conn,"SELECT * FROM hus WHERE ORIGRANDGROUP<=1") 	# Note: 5 
dpus <- dbGetQuery(conn,"SELECT pus.* FROM pus WHERE pus.SERIALNO IN \
   (SELECT DISTINCT hus.SERIALNO FROM hus \
   WHERE hus.ORIGRANDGROUP<=1)") 	# Note: 6 
dbDisconnect(conn) 	# Note: 7 
save(dhus,dpus,file='phsample.RData') 	# Note: 8

# Note 1: 
#   Set Java option for extra memory before DB 
#   drivers are loaded. 

# Note 2: 
#   Specify the name of the database driver, same 
#   as in our XML database configuration. 

# Note 3: 
#   Specify where to find the implementation of 
#   the database driver. 

# Note 4: 
#   SQL column names with mixed-case 
#   capitalization, special characters, or that 
#   collide with reserved words must be quoted. We 
#   specify single-quote as the quote we’ll use when 
#   quoting column names, which may different than the 
#   quote we use for SQL literals. 

# Note 5: 
#   Create a data frame called dhus from * 
#   (everything) from the database table hus, taking 
#   only rows where ORGINRANGGROUP <= 1. The 
#   ORGINRANDGROUP column is a random integer from 0 
#   through 999 that SQL Screwdriver adds to the rows 
#   during data load to facilitate sampling. In this 
#   case, we’re taking 2/1000 of the data rows to get 
#   a small sample. 

# Note 6: 
#   Create a data frame called dpus from the 
#   database table pus, taking only records that have 
#   a household ID in the set of household IDs we 
#   selected from households table hus. 

# Note 7: 
#   Disconnect for the database. 

# Note 8: 
#   Save the two data frames into a file named 
#   phsample.RData, which can be read in with load(). 
#   Try help("save") or help("load") for more 
#   details. 

