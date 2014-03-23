# example 7.12 of section 7.2.3 
# (example 7.12 of section 7.2.3)  : Linear and logistic regression : Using logistic regression : Making predictions 
# Title: Exploring modeling trade-offs 

library(ROCR)                                      	# Note: 1 
library(grid)                                      	# Note: 2 

predObj <- prediction(train$pred, train$atRisk)     	# Note: 3 
precObj <- performance(predObj, measure="prec")     	# Note: 4 
recObj <- performance(predObj, measure="rec")       	# Note: 5 

precision <- (precObj@y.values)[[1]]                	# Note: 6 
prec.x <- (precObj@x.values)[[1]]                   	# Note: 7 
recall <- (recObj@y.values)[[1]]

rocFrame <- data.frame(threshold=prec.x, precision=precision,
                      recall=recall)               	# Note: 8 

nplot <- function(plist) {                          	# Note: 9 
  n <- length(plist)
  grid.newpage()
  pushViewport(viewport(layout=grid.layout(n,1)))
  vplayout=function(x,y) {viewport(layout.pos.row=x, layout.pos.col=y)}
  for(i in 1:n) {
    print(plist[[i]], vp=vplayout(i,1))
  }
}

pnull <- mean(as.numeric(train$atRisk))             	# Note: 10 

p1 <- ggplot(rocFrame, aes(x=threshold)) +          	# Note: 11 
  geom_line(aes(y=precision/pnull)) +
  coord_cartesian(xlim = c(0,0.05), ylim=c(0,10) )

p2 <- ggplot(rocFrame, aes(x=threshold)) +          	# Note: 12 
  geom_line(aes(y=recall)) +
  coord_cartesian(xlim = c(0,0.05) )

nplot(list(p1, p2))                                	# Note: 13

# Note 1: 
#   Load ROCR library. 

# Note 2: 
#   Load grid library (you’ll need this for the 
#   nplot function below). 

# Note 3: 
#   Create ROCR prediction object. 

# Note 4: 
#   Create ROCR object to calculate precision as 
#   a function of threshold. 

# Note 5: 
#   Create ROCR object to calculate recall as a 
#   function of threshold. 

# Note 6: 
#   at ( @ ) symbol@ (at) symbolROCR objects are what R calls S4 objects; 
#   the slots (or fields) of an S4 object are stored 
#   as lists within the object. You extract the slots 
#   from an S4 object using @ notation. 

# Note 7: 
#   The x values (thresholds) are the same in 
#   both predObj and recObj, so you only need to 
#   extract them once. 

# Note 8: 
#   Build data frame with thresholds, precision, 
#   and recall. 

# Note 9: 
#   Function to plot multiple plots on one page 
#   (stacked). 

# Note 10: 
#   Calculate rate of at-risk births in the 
#   training set. 

# Note 11: 
#   Plot enrichment rate as a function of 
#   threshold. 

# Note 12: 
#   Plot recall as a function of 
#   threshold. 

# Note 13: 
#   Show both plots simultaneously. 

