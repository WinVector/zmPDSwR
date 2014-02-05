# example:1_A.3.4 
# example:1 : Working with R and other tools : Using databases with R : An example SQL data transformation task 
library('reshape2')
bthin <- melt(bookings,id.vars=c('date'),
   variable.name='daysBefore',value.name='bookings') 	# Note: 1 
pthin <- melt(prices,id.vars=c('date'),
   variable.name='daysBefore',value.name='price') 	# Note: 2 
> daysCodes <- c('day.of.stay', 'X1.before', 'X2.before', 'X3.before')
> bthin$nDaysBefore <- match(bthin$daysBefore,daysCodes)-1 	# Note: 3 
> pthin$nDaysBefore <- match(pthin$daysBefore,daysCodes)-1 	# Note: 4 
> print(bthin[1:3,])
        date  daysBefore bookings nDaysBefore
1 2009-06-30 day.of.stay      105          0
2 2009-07-01 day.of.stay      103          0
3 2009-07-02 day.of.stay      105          0
> print(pthin[1:3,])
        date  daysBefore price nDaysBefore
1 2009-06-30 day.of.stay   250          0
2 2009-07-01 day.of.stay   200          0
3 2009-07-02 day.of.stay   200          0

# Note 1: 
#   Use melt to change 
#   columns that are not date (day.of.stay, Xk.before) 
#   to values stored in a new column called 
#   daysBefore. Each booking count becomes a new row 
#   (instead of having many different bookings in the 
#   same row). 

# Note 2: 
#   Use melt to change 
#   columns that are not date (day.of.stay, Xk.before) 
#   to values stored in a new column called 
#   daysBefore. Each price entry becomes a new row 
#   (instead of having many different pricings in the 
#   same row). 

# Note 3: 
#   Use match and dayCodes 
#   list to convert key strings to numeric 
#   nDaysBefore in our bookings data. 

# Note 4: 
#   Use match and dayCodes 
#   list to convert key strings to numeric 
#   nDaysBefore in our price data. 
