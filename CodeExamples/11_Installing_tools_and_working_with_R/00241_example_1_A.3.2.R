# example:1_A.3.2 
# example:1 : Installing tools and working with R : Using databases with R : Starting with SQuirreL SQL 

> install.packages('RJDBC')  	# Note: 1 
> library('RJDBC') 	# Note: 2 
> drv <- JDBC("org.h2.Driver","h2-1.3.170.jar",identifier.quote="'") 	# Note: 3 
> conn <- dbConnect(drv,"jdbc:h2://h2demodb_h2","u","u") 	# Note: 4 
> d <- dbGetQuery(conn,"SELECT * FROM example_table") 	# Note: 5 
> print(d)  	# Note: 6 
  STATUSID NAME
1        1  Joe
2        2 Fred       	# Note: 7 


# Note 1: 
#   Install the RJDBC package 
#   from the CRAN package repository. 

# Note 2: 
#   Load the RJDBC 
#   library. 

# Note 3: 
#   Use the RJDBC library to 
#   build a database driver. 

# Note 4: 
#   Use the database driver to 
#   build a database connection. 

# Note 5: 
#   Run a select SQL query using 
#   the database connection to populate a 
#   dataframe. 

# Note 6: 
#   Print the result 
#   dataframe. 

# Note 7: 
#   The database table as an R 
#   dataframe. 
