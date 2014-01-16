# informalexample:4_3.2.2 
# informalexample:4 : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
ggplot(custdata2, aes(x=age, y=income)) + geom_point() +
  stat_smooth(method="lm") +
  ylim(0, 200000)
