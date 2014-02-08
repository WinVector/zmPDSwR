# informalexample:4_3.2.1 
# informalexample:4 : Exploring data : Spotting problems using graphics and visualization : Visually checking distributions for a single variable 
# Title: Bar charts show the distribution of categorical variables. 

ggplot(custdata) + geom_bar(aes(x=marital.stat), fill="gray")

