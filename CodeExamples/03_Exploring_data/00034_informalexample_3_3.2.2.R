# informalexample:3_3.2.2 
# informalexample:3 : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
ggplot(custdata2, aes(x=age, y=income)) +
   geom_point() + ylim(0, 200000)
