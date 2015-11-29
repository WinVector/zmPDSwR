# example 9.16 of section 9.3.1 
# (example 9.16 of section 9.3.1)  : Exploring advanced methods : Using kernel methods to increase data separation : Understanding kernel functions 
# Title: An artificial kernel example 

> u <- c(1,2)
> v <- c(3,4)
> k <- function(u,v) { 	# Note: 1 
     u[1]*v[1] + u[2]*v[2] +
        u[1]*u[1]*v[1]*v[1] + u[2]*u[2]*v[2]*v[2] +
        u[1]*u[2]*v[1]*v[2]
  }
> phi <- function(x) { 	# Note: 2 
     x <- as.numeric(x)
     c(x,x*x,combn(x,2,FUN=prod))
  }
> print(k(u,v)) 	# Note: 3 
[1] 108
> print(phi(u))
[1] 1 2 1 4 2
> print(phi(v))
[1]  3  4  9 16 12
> print(as.numeric(phi(u) %*% phi(v))) 	# Note: 4 
[1] 108

# Note 1: 
#   Define a function of two vector variables 
#   (both two dimensional) as the sum of various products of terms. 

# Note 2: 
#   Define a function of a single vector variable 
#   that returns a vector containing the original entries plus all products of 
#   entries. 

# Note 3: 
#   Example evaluation of k(,). 

# Note 4: 
#   Confirm phi() agrees with k(,). phi() is the certificate that shows k(,) is in fact a 
#   kernel. 

