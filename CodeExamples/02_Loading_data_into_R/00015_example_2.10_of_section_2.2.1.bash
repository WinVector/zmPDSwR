# example 2.10 of section 2.2.1 
# (example 2.10 of section 2.2.1)  : Loading data into R : Working with relational databases : A production-size example 
# Title: Loading data with SQL Screwdriver 

java -classpath SQLScrewdriver.jar:h2-1.3.170.jar \ 	# Note: 1 
   com.winvector.db.LoadFiles \ 	# Note: 2 
   file:dbDef.xml \ 	# Note: 3 
   , \ 	# Note: 4 
   hus \ 	# Note: 5 
   file:csv_hus/ss11husa.csv file:csv_hus/ss11husb.csv 	# Note: 6 
java -classpath SQLScrewdriver.jar:h2-1.3.170.jar \ 	# Note: 7 
  com.winvector.db.LoadFiles \
   file:dbDef.xml , pus \
   file:csv_pus/ss11pusa.csv file:csv_pus/ss11pusb.csv

# Note 1: 
#   Java command and required JARs. The JARs in 
#   this case are SQL Screwdriver and the required 
#   database driver. 

# Note 2: 
#   Class to run: LoadFiles, the meat of SQL 
#   Screwdriver. 

# Note 3: 
#   URL pointing to database credentials. 

# Note 4: 
#   Separator to expect in input file (use t for 
#   tab). 

# Note 5: 
#   Name of table to create. 

# Note 6: 
#   List of comma-separated files to load into 
#   table. 

# Note 7: 
#   Same load pattern for personal information 
#   table. 

