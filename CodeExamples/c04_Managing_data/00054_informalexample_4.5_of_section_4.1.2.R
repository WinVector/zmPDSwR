# informalexample 4.5 of section 4.1.2 
# (informalexample 4.5 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 

signedlog10 <- function(x) {
  ifelse(abs(x) <= 1, 0, sign(x)*log10(abs(x)))
}

