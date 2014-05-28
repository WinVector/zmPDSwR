
# pretty much figure 4.2 from the book (author ref: datasets/Census/PUMSold/ManagingData_explore.R)
library('ggplot2')
load('exampleData.rData')
ggplot(subset(custdata, custdata$income > 1000), aes(x=income, y=as.numeric(health.ins))) +
   geom_point(alpha=0.5, position=position_jitter(w=0.05, h=0.05)) + geom_smooth() + scale_x_log10() + 
   annotation_logticks(sides="bt")
