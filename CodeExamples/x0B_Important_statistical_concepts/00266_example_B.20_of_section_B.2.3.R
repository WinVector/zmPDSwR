# example B.20 of section B.2.3 
# (example B.20 of section B.2.3)  : Important statistical concepts : Statistical theory : Power of tests 
# Title: Exact binomial sample size calculation 

errorProb <- function(targetRate,difference,size) { 	# Note: 1 
   pbinom(ceiling((targetRate-difference)*size),
      size=size,prob=targetRate) 
}

print(errorProb(0.045,0.004,est)) 	# Note: 2 
## [1] 0.04153646

binSearchNonPositive <- function(fEventuallyNegative) { 	# Note: 3 
  low <- 1
  high <- low+1
  while(fEventuallyNegative(high)>0) {
    high <- 2*high
  }
  while(high>low+1) {
    m <- low + (high-low) %/% 2
    if(fEventuallyNegative(m)>0) {
       low <- m
    } else {
       high <- m
    }
  }
  high
}

actualSize <- function(targetRate,difference,errorProb) {
   binSearchNonPositive(function(n) {
       errorProb(targetRate,difference,n) - errorProb })
}

size <- actualSize(0.045,0.004,0.05) 	# Note: 4 
print(size) 
## [1] 7623
print(errorProb(0.045,0.004,size))
## [1] 0.04983659

# Note 1: 
#   Define a function that calculates the 
#   probability of seeing a low number of conversions, assuming the actual 
#   conversion rate is targetRate and the size of the experiment is size. Low is 
#   considered be a count that’s at least difference*size below the expected value 
#   targetRate*size. 

# Note 2: 
#   Calculate probability of a bad experiment using 
#   estimated experiment size. The failure odds are around 4% (under the 5% we’re 
#   designing for), which means the estimate size was slightly high. 

# Note 3: 
#   Define a binary search that finds a non-positive 
#   value of a function that’s guaranteed to be eventually negative. This search 
#   works around the minor non-monotonicity in errorProb() (due to rounding 
#   issues). 

# Note 4: 
#   Calculate the required sample size for our B 
#   experiment. 

