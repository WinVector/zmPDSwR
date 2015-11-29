# example 10.7 of section 10.3.1 
# (example 10.7 of section 10.3.1)  : Documentation and deployment : Using comments and version control for running documentation : Writing effective comments 
# Title: Example code comment 

#    Return the pseudo logarithm of x, which is close to
# sign(x)*log10(abs(x)) for x such that abs(x) is large
# and doesn't "blow up" near zero.  Useful
# for transforming wide-range variables that may be negative
# (like profit/loss).
# See: http://www.win-vector.com/blog
#  /2012/03/modeling-trick-the-signed-pseudo-logarithm/
#    NB: This transform has the undesirable property of making most
# signed distributions appear bimodal around the origin, no matter
# what the underlying distribution really looks like.
# The argument x is assumed be numeric and can be a vector.
pseudoLog10 <- function(x) { asinh(x/2)/log(10) }

