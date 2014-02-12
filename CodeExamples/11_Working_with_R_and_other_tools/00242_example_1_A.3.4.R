# example:1_A.3.4 
# example:1 : Working with R and other tools : Using databases with R : An example SQL data transformation task 
# Title: 
                                        Loading an Excel spreadsheet 


                                        Loading an Excel spreadsheet
                                        library('xlsx')
bookings <- read.xlsx('Workbook1.xlsx',1,startRow=3)
prices <- read.xlsx('Workbook1.xlsx',2,startRow=3)

