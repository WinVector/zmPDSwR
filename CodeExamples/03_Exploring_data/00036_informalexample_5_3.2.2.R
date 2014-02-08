# informalexample:5_3.2.2 
# informalexample:5 : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: A scatter plot of income versus age, with a smoothing curve 

ggplot(custdata2, aes(x=age, y=income)) +
   geom_point() + geom_smooth() +
   ylim(0, 200000)

