# example 4.9 of section 4.2.2 
# (example 4.9 of section 4.2.2)  : Managing data : Sampling for modeling and validation : Creating a sample group column 
# Title: Splitting into test and training using a random group mark 

> custdata$gp <- runif(dim(custdata)[1])  	# Note: 1 
> testSet <- subset(custdata, custdata$gp <= 0.1) 	# Note: 2 
> trainingSet <- subset(custdata, custdata$gp > 0.1) 	# Note: 3 
> dim(testSet)[1]
[1] 93
> dim(trainingSet)[1]
[1] 907

# Note 1: 
#   dim(custdata) returns the number of rows and 
#   columns of the data frame as a vector, so 
#   dim(custdata)[1] returns the number of rows. 

# Note 2: 
#   Here we generate a test set of about 10% of 
#   the data (93 customers—a little over 9%, actually) 
#   and train on the remaining 90%. 

# Note 3: 
#   Here we generate a training using the 
#   remaining data. 

