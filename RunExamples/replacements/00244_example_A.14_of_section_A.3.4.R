# example A.14 of section A.3.4 
# (example A.14 of section A.3.4)  : Working with R and other tools : Using databases with R : An example SQL data transformation task 
# Title: Assembling many rows using SQL 

# Book annotation hooks inside the SQL cause problems.

options(gsubfn.engine = "R")
library('sqldf')
joined <- sqldf(' 
  select 
     bCurrent.date as StayDate, 
     bCurrent.daysBefore as daysBefore,
     bCurrent.nDaysBefore as nDaysBefore,
     p.price as price,
     bCurrent.bookings as bookingsCurrent,
     bPrevious.bookings as bookingsPrevious,
     bCurrent.bookings - bPrevious.bookings as pickup
  from
     bthin bCurrent
  join
     bthin bPrevious 
  on
     bCurrent.date=bPrevious.date
     and bCurrent.nDaysBefore+1=bPrevious.nDaysBefore 
  join
     pthin p 
  on
     bCurrent.date=p.date
     and bCurrent.nDaysBefore=p.nDaysBefore 
')
print(joined)
