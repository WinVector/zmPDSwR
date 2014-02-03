
library(ggplot2)
library(grid)

p1 <- ggplot(pframe, aes(x=PWGT)) +
    geom_point(aes(y=scale(sPWGT, scale=F))) +
    geom_smooth(aes(y=scale(DBWT, scale=F)))

p2 <- ggplot(pframe, aes(x=WTGAIN)) +
    geom_point(aes(y=scale(sWTGAIN, scale=F))) +
    geom_smooth(aes(y=scale(DBWT, scale=F)))

p3 <- ggplot(pframe, aes(x=MAGER)) +
    geom_point(aes(y=scale(sMAGER, scale=F))) +
    geom_smooth(aes(y=scale(DBWT, scale=F)))

p4 <- ggplot(pframe, aes(x=UPREVIS)) +
    geom_point(aes(y=scale(sUPREVIS, scale=F))) +
    geom_smooth(aes(y=scale(DBWT, scale=F)))

#
# Plot multiple plot objects on one page
#
nplot = function(plist, ncol=1) {
  n = length(plist)
  nrow = ceiling(n/ncol)
  grid.newpage()
  pushViewport(viewport(layout=grid.layout(nrow,ncol)))
  vplayout=function(x,y) {viewport(layout.pos.row=x, layout.pos.col=y)} 
  for(i in 1:n) {
    irow = ceiling(i/ncol)
    icol = i - ncol*(irow-1)
    print(plist[[i]], vp=vplayout(irow,icol))
  }
}

nplot(list(p1,p2,p3,p4),ncol=2)
