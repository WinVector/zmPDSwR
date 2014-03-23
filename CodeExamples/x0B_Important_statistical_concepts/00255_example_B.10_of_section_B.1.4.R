# example B.10 of section B.1.4 
# (example B.10 of section B.1.4)  : Important statistical concepts : Distributions : Binomial distribution 
# Title: Working with the binomial distribution 

# pbinom example

nflips <- 100
nheads <- c(25, 45, 50, 60)  # number of heads

# what are the probabilities of observing at most that 
# number of heads on a fair coin?
left.tail <- pbinom(nheads, nflips, 0.5)
sprintf("%2.2f", left.tail)
# [1] "0.00" "0.18" "0.54" "0.98"

# the probabilities of observing more than that
# number of heads on a fair coin?
right.tail <- pbinom(nheads, nflips, 0.5, lower.tail=F)
sprintf("%2.2f", right.tail)
# [1] "1.00" "0.82" "0.46" "0.02"

# as expected:
left.tail+right.tail
#  [1] 1 1 1 1 

# so if you flip a fair coin 100 times,
# you are guaranteed to see more than 10 heads, 
# almost guaranteed to see fewer than 60, and
# probably more than 45.

# qbinom example

nflips <- 100

# what's the 95% "central" interval of heads that you
# would expect to observe on 100 flips of a fair coin?

left.edge <- qbinom(0.025, nflips, 0.5)
right.edge <- qbinom(0.025, nflips, 0.5, lower.tail=F)
c(left.edge, right.edge)
# [1] 40 60

# so with 95% probability you should see between 40 and 60 heads

