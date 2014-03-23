# example 9.6 of section 9.2.2 
# (example 9.6 of section 9.2.2)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : A one-dimensional regression example 
# Title: Preparing an artificial problem 

set.seed(602957)

x <- rnorm(1000)
noise <- rnorm(1000, sd=1.5)

y <- 3*sin(2*x) + cos(0.75*x) - 1.5*(x^2 ) + noise

select <- runif(1000)
frame <- data.frame(y=y, x = x)

train <- frame[select > 0.1,]
test <-frame[select <= 0.1,]

