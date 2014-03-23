# example A.13 of section A.3.4 
# (example A.13 of section A.3.4)  : Working with R and other tools : Using databases with R : An example SQL data transformation task 
# Title: Using melt to restructure data 

library('reshape2')
bthin <- melt(bookings,id.vars=c('date'),
   variable.name='daysBefore',value.name='bookings') 	# Note: 1 
pthin <- melt(prices,id.vars=c('date'),
   variable.name='daysBefore',value.name='price') 	# Note: 2 
daysCodes <- c('day.of.stay', 'X1.before', 'X2.before', 'X3.before')
bthin$nDaysBefore <- match(bthin$daysBefore,daysCodes)-1 	# Note: 3 
pthin$nDaysBefore <- match(pthin$daysBefore,daysCodes)-1 	# Note: 4 
pthin$price <- as.numeric(gsub('\\$','',pthin$price)) 	# Note: 5 
> print(head(pthin))
        date  daysBefore price nDaysBefore
1 2013-07-01 day.of.stay   250           0
2 2013-07-02 day.of.stay   200           0
3 2013-07-03 day.of.stay   200           0
4 2013-07-04 day.of.stay   250           0
5 2013-07-01   X1.before   200           1
6 2013-07-02   X1.before   250           1

# Note 1: 
#   Use melt to change columns that are not date 
#   (day.of.stay, Xn.before) to values stored in a new 
#   column called daysBefore. Each booking count 
#   becomes a new row (instead of having many 
#   different bookings in the same row). 

# Note 2: 
#   Each price entry becomes a new row (instead 
#   of having many different prices in the same 
#   row). 

# Note 3: 
#   Use match and dayCodes list to convert key 
#   strings to numeric nDaysBefore in our bookings 
#   data. 

# Note 4: 
#   Use match and dayCodes list to convert key 
#   strings to numeric nDaysBefore in our price 
#   data. 

# Note 5: 
#   Remove dollar sign and convert prices to 
#   numeric type. 

