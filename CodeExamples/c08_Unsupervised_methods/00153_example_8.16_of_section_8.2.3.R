# example 8.16 of section 8.2.3 
# (example 8.16 of section 8.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Examining the transaction data 

> class(bookbaskets)             	# Note: 1 
[1] "transactions"
attr(,"package")
[1] "arules"
> bookbaskets                    	# Note: 2 
transactions in sparse format with
 92108 transactions (rows) and
 220447 items (columns)
> dim(bookbaskets)               	# Note: 3 
[1]  92108 220447
> colnames(bookbaskets)[1:5]     	# Note: 4 
[1] " A Light in the Storm:[...]"
[2] " Always Have Popsicles"
[3] " Apple Magic"
[4] " Ask Lily"
[5] " Beyond IBM: Leadership Marketing and Finance for the 1990s"
> rownames(bookbaskets)[1:5]        	# Note: 5 
[1] "10"     "1000"   "100001" "100002" "100004"

# Note 1: 
#   The object is of class transactions. 

# Note 2: 
#   Printing the object tells you its 
#   dimensions. 

# Note 3: 
#   You can also use dim() to see the dimensions 
#   of the matrix. 

# Note 4: 
#   The columns are labeled by book 
#   title. 

# Note 5: 
#   The rows are labeled by customer. 

