# example 2.2 of section 2.1.1 
# (example 2.2 of section 2.1.1)  : Loading data into R : Working with data from files : Working with well-structured data from files or URLs 
# Title: Exploring the car data 

> class(uciCar)
[1] "data.frame" 	# Note: 1 
> summary(uciCar)
   buying      maint       doors
 high :432   high :432   2    :432
 low  :432   low  :432   3    :432
 med  :432   med  :432   4    :432
 vhigh:432   vhigh:432   5more:432

 persons     lug_boot    safety
 2   :576   big  :576   high:576
 4   :576   med  :576   low :576
 more:576   small:576   med :576

   rating
 acc  : 384
 good :  69
 unacc:1210
 vgood:  65

> dim(uciCar)
[1] 1728    7   	# Note: 2

# Note 1: 
#   The loaded object uciCar is of type data.frame. 

# Note 2: 
#   The [1] is just an output sequence 
#   marker. The actual information is this: uciCar has 
#   1728 rows and 7 columns. Always try to confirm you 
#   got a good parse by at least checking that the 
#   number of rows is exactly one fewer than the 
#   number of lines of text in the original file. The 
#   difference of one is because the column header 
#   counts as a line, but not as a data row. 

