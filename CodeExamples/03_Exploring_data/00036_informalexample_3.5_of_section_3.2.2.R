# informalexample 3.5 of section 3.2.2 
# (informalexample 3.5 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 

ggplot(custdata2, aes(x=age, y=income)) +
   geom_point() + geom_smooth() +
   ylim(0, 200000)

