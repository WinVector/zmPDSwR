# example A.10 of section A.3.2 
# (example A.10 of section A.3.2)  : Working with R and other tools : Using databases with R : Starting with SQuirreL SQL 
# Title: Reading database data into R 

> install.packages('RJDBC')  	# Note: 1 
> library('RJDBC') 	# Note: 2 
> drv <- JDBC("org.h2.Driver","h2-1.3.170.jar",identifier.quote="'") 	# Note: 3 
> setwd('/Users/johnmount/Downloads')
> conn <- dbConnect(drv,"jdbc:h2://h2demodb_h2","u","u") 	# Note: 4 
> d <- dbGetQuery(conn,"SELECT * FROM example_table") 	# Note: 5 
> print(d)  	# Note: 6 
  STATUSID NAME
1        1  Joe
2        2 Fred       	# Note: 7

# Note 1: 
#   Install the RJDBC package from the CRAN 
#   package repository. 

# Note 2: 
#   Load the RJDBC library. 

# Note 3: 
#   Use the RJDBC library to build a database 
#   driver. 

# Note 4: 
#   Use the database driver to build a database 
#   connection. In our SQuirreL SQL example, we used 
#   the path /Users/johnmount/Downloads/h2demodb_h2. 
#   So the path fragment given here (h2demodb_h2) 
#   works only if R is working in the directory 
#   /Users/johnmount/Downloads. You would alter all of 
#   these paths and URLs to work for your own 
#   directories. 

# Note 5: 
#   Run a SQL select query using the database 
#   connection to populate a data frame. 

# Note 6: 
#   Print the result data frame. 

# Note 7: 
#   The database table as an R data frame. 

