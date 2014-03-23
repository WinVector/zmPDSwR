# example 3.10 of section 3.2.1 
# (example 3.10 of section 3.2.1)  : Exploring data : Spotting problems using graphics and visualization : Visually checking distributions for a single variable 
# Title: Producing a bar chart with sorted categories 

> statesums <- table(custdata$state.of.res) 	# Note: 1 
> statef <- as.data.frame(statesums) 	# Note: 2 
> colnames(statef)<-c("state.of.res", "count") 	# Note: 3 
> summary(statef)  	# Note: 4 
state.of.res     count
Alabama   : 1    Min.   :  1.00
Alaska    : 1    1st Qu.:  5.00
Arizona   : 1    Median : 12.00
Arkansas  : 1    Mean   : 20.00
California: 1    3rd Qu.: 26.25
Colorado  : 1    Max.   :100.00
(Other)   :44
> statef <- transform(statef,
   state.of.res=reorder(state.of.res, count)) 	# Note: 5 
> summary(statef)                       	# Note: 6 
state.of.res     count
Delaware    : 1    Min.   :  1.00
North Dakota: 1    1st Qu.:  5.00
Wyoming     : 1    Median : 12.00
Rhode Island: 1    Mean   : 20.00
Alaska      : 1    3rd Qu.: 26.25
Montana     : 1    Max.   :100.00
(Other)     :44
> ggplot(statef)+ geom_bar(aes(x=state.of.res,y=count),
   stat="identity",              	# Note: 7 
   fill="gray") +
   coord_flip() +                                       	# Note: 8 
   theme(axis.text.y=element_text(size=rel(0.8)))

# Note 1: 
#   The table() command aggregates the data by state of residence—exactly the information the bar 
#   chart plots. 

# Note 2: 
#   Convert the table to a data frame. The default column names are Var1 and Freq. 

# Note 3: 
#   Rename the columns for readability. 

# Note 4: 
#   Notice that the default ordering for the 
#   state.of.res variable is alphabetical. 

# Note 5: 
#   Use the reorder() function to set the 
#   state.of.res variable to be count ordered. Use the transform() function 
#   to apply the transformation to the state.of.res data frame. 

# Note 6: 
#   The state.of.res variable is now count 
#   ordered. 

# Note 7: 
#   Since the data is being passed to 
#   geom_bar pre-aggregated, specify both the x and 
#   y variables, and use stat="identity" to plot the 
#   data exactly as given. 

# Note 8: 
#   Flip the axes and reduce the size of the 
#   label text as before. 

