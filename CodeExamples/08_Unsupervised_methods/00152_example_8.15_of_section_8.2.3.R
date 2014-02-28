# example 8.15 of section 8.2.3 
# (example 8.15 of section 8.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Reading in the book data 

library(arules)  	# Note: 1 
bookbaskets <- read.transactions("bookdata.tsv.gz", format="single",  	# Note: 2 
                                 sep="\t",                    	# Note: 3 
                                 cols=c("userid", "title"),    	# Note: 4 
                                 rm.duplicates=T)       	# Note: 5

# Note 1: 
#   Load the arules package. 

# Note 2: 
#   Specify the file and the file format. 

# Note 3: 
#   Specify the column separator (a tab). 

# Note 4: 
#   Specify the column of transaction IDs and of 
#   item IDs, respectively. 

# Note 5: 
#   Tell the function to look for and remove 
#   duplicate entries (for example, multiple entries 
#   for “The Hobbit” by the same user). 

