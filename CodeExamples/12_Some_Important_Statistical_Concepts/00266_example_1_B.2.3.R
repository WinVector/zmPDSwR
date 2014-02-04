# example:1_B.2.3 
# example:1 : Some Important Statistical Concepts : Statistical theory : Power of tests 
estimate <- function(targetRate,difference,errorProb) {
    ceiling(-log(errorProb)*targetRate/(difference^2))
}

est <- estimate(0.045,0.004,0.05)
print(est)
## [1] 8426

