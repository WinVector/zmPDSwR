# example 9.18 of section 9.3.2 
# (example 9.18 of section 9.3.2)  : Exploring advanced methods : Using kernel methods to increase data separation : Using an explicit kernel on a problem 
# Title: Applying an example explicit kernel transform 

phi <- function(x) { 	# Note: 1 
     x <- as.numeric(x)
     c(x,x*x,combn(x,2,FUN=prod))
  }
phiNames <- function(n) { 	# Note: 2 
     c(n,paste(n,n,sep=':'),
        combn(n,2,FUN=function(x) {paste(x,collapse=':')}))
  }
modelMatrix <- model.matrix(~ 0 + AGEP + SEX + COW + SCHL,psub) 	# Note: 3 
colnames(modelMatrix) <- gsub('[^a-zA-Z0-9]+','_',
   colnames(modelMatrix)) 	# Note: 4 
pM <- t(apply(modelMatrix,1,phi)) 	# Note: 5 
vars <- phiNames(colnames(modelMatrix))
vars <- gsub('[^a-zA-Z0-9]+','_',vars)
colnames(pM) <- vars 	# Note: 6 
pM <- as.data.frame(pM)
pM$PINCP <- psub$PINCP
pM$ORIGRANDGROUP <- psub$ORIGRANDGROUP
pMtrain <- subset(pM,ORIGRANDGROUP >= 500)
pMtest <- subset(pM,ORIGRANDGROUP < 500) 	# Note: 7

# Note 1: 
#   Define our primal kernel function: map a 
#   vector to a copy of itself plus all square terms and cross-multiplied 
#   terms. 

# Note 2: 
#   Define a function similar to our primal 
#   kernel, but working on variable names instead of values. 

# Note 3: 
#   Convert data to a matrix where all 
#   categorical variables are encoded as multiple numeric indicators. 

# Note 4: 
#   Remove problematic characters from matrix 
#   column names. 

# Note 5: 
#   Apply the primal kernel function to every 
#   row of the matrix and transpose results so they’re written as rows (not as a 
#   list as returned by apply()). 

# Note 6: 
#   Extend names from original matrix to 
#   names for compound variables in new matrix. 

# Note 7: 
#   Add in outcomes, test/train split 
#   columns, and prepare new data for modeling. 

