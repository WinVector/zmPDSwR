# informalexample:6_4.1.2 
# informalexample:6 : Managing data : Cleaning data : Data transformations 
signedlog10 <- function(x) {
  ifelse(abs(x) <= 1, 0, sign(x)*log10(abs(x)))
}
