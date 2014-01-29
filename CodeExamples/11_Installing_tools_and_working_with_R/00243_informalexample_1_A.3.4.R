# informalexample:1_A.3.4 
# informalexample:1 : Installing tools and working with R : Using databases with R : An example SQL data transformation task 
library('xlsx')
bookings <- read.xlsx('Workbook1.xlsx',1,startRow=3)
prices <- read.xlsx('Workbook1.xlsx',2,startRow=3)
