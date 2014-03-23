# example A.14 of section A.3.4 
# (example A.14 of section A.3.4)  : Working with R and other tools : Using databases with R : An example SQL data transformation task 
# Title: Assembling many rows using SQL 

options(gsubfn.engine = "R") 	# Note: 1 
library('sqldf')
joined <- sqldf(' 	# Note: 2 
  select 	# Note: 3 
     bCurrent.date as StayDate, 	# Note: 4 
     bCurrent.daysBefore as daysBefore,
     bCurrent.nDaysBefore as nDaysBefore,
     p.price as price,
     bCurrent.bookings as bookingsCurrent,
     bPrevious.bookings as bookingsPrevious,
     bCurrent.bookings - bPrevious.bookings as pickup
  from
     bthin bCurrent 	# Note: 5 
  join
     bthin bPrevious 	# Note: 6 
  on
     bCurrent.date=bPrevious.date
     and bCurrent.nDaysBefore+1=bPrevious.nDaysBefore 	# Note: 7 
  join
     pthin p 	# Note: 8 
  on
     bCurrent.date=p.date
     and bCurrent.nDaysBefore=p.nDaysBefore 	# Note: 9 
')
print(joined)

# Note 1: 
#   Prevent library(sqldf) from triggering a 
#   tcl/tk dependency which causes R to exit on OS X 
#   if X11 isn’t installed. See 
#   https://code.google.com/p/sqldf/ for 
#   troubleshooting details. 

# Note 2: 
#   Create a new data frame of rows built out of 
#   triples of rows from pthin and bthin. 

# Note 3: 
#   SQL statements typically start with the word 
#   “select.” 

# Note 4: 
#   List of derived columns (and their new 
#   names) for our new data frame. 

# Note 5: 
#   First data frame we’re pulling data from: 
#   bthin. 

# Note 6: 
#   Second pull from bthin. 

# Note 7: 
#   Conditions to match b1 rows to b2 
#   rows. 

# Note 8: 
#   Third data frame we are pulling data from: 
#   pthin. 

# Note 9: 
#   Conditions to match p to b2 (and implicitly 
#   b1). 

