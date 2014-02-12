# example:1_2.1.2 
# example:1 : Loading data into R : Working with data from files : Using R on less-structured data 
# Title: 
                                        Loading the credit dataset 


                                        Loading the credit dataset
read.table(paste('http://archive.ics.uci.edu/ml/',
   'machine-learning-databases/statlog/german/german.data',sep=''),
   stringsAsFactors=F,header=F)
print(d[1:3,])

