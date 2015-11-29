# example 5.5 of section 5.2.2 
# (example 5.5 of section 5.2.2)  : Choosing and evaluating models : Evaluating models : Evaluating scoring models 
# Title: Plotting residuals 

d <- data.frame(y=(1:10)^2,x=1:10)
model <- lm(y~x,data=d)
d$prediction <- predict(model,newdata=d)
library('ggplot2')
ggplot(data=d) + geom_point(aes(x=x,y=y)) +
    geom_line(aes(x=x,y=prediction),color='blue') +
    geom_segment(aes(x=x,y=prediction,yend=y,xend=x)) +
    scale_y_continuous('')

