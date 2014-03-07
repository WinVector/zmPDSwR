# example 3.1 of section 3.1 
# (example 3.1 of section 3.1)  : Exploring data : Using summary statistics to spot problems 
# Title: The summary() command 

> summary(custdata)
custid        sex
Min.   :   2068   F:440
1st Qu.: 345667   M:560
Median : 693403
Mean   : 698500
3rd Qu.:1044606
Max.   :1414286

is.employed         income     	# Note: 1 
Mode :logical   Min.   : -8700
FALSE:73        1st Qu.: 14600
TRUE :599       Median : 35000
NA's :328       Mean   : 53505
                3rd Qu.: 67000
                Max.   :615000

marital.stat
Divorced/Separated:155
Married           :516
Never Married     :233
Widowed           : 96

health.ins                    	# Note: 2 
Mode :logical
FALSE:159
TRUE :841
NA's :0

housing.type                        	# Note: 3 
Homeowner free and clear    :157
Homeowner with mortgage/loan:412
Occupied with no rent       : 11
Rented                      :364
NA's                        : 56

recent.move      num.vehicles
Mode :logical   Min.   :0.000
FALSE:820       1st Qu.:1.000
TRUE :124       Median :2.000
NA's :56        Mean   :1.916
                3rd Qu.:2.000
                Max.   :6.000
                NA's   :56

age              state.of.res       	# Note: 4 
Min.   :  0.0   California  :100
1st Qu.: 38.0   New York    : 71
Median : 50.0   Pennsylvania: 70
Mean   : 51.7   Texas       : 56
3rd Qu.: 64.0   Michigan    : 52
Max.   :146.7   Ohio        : 51
                (Other)     :600

# Note 1: 
#   The variable is.employed is missing for 
#   about a third of the data. The variable income has negative values, which are 
#   potentially invalid. 

# Note 2: 
#   About 84% of the customers have health 
#   insurance. 

# Note 3: 
#   The variables housing.type, recent.move, and 
#   num.vehicles are each missing 56 values. 

# Note 4: 
#   The average value of the variable age seems 
#   plausible, but the minimum and maximum values seem unlikely. The variable 
#   state.of.res is a categorical variable; summary() reports how many customers are in 
#   each state (for the first few states). 

