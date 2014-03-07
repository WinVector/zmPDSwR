# example B.25 of section B.3.2 
# (example B.25 of section B.3.2)  : Important statistical concepts : Examples of the statistical view of data : Omitted variable bias 
# Title: Summarizing our synthetic biological data 

> load('synth.RData')
> print(summary(s))
      week         Caco2A2BPapp       FractionHumanAbsorption
 Min.   :  1.00   Min.   :6.994e-08   Min.   :0.09347        
 1st Qu.: 25.75   1st Qu.:7.312e-07   1st Qu.:0.50343        
 Median : 50.50   Median :1.378e-05   Median :0.86937        
 Mean   : 50.50   Mean   :2.006e-05   Mean   :0.71492        
 3rd Qu.: 75.25   3rd Qu.:4.238e-05   3rd Qu.:0.93908        
 Max.   :100.00   Max.   :6.062e-05   Max.   :0.99170
> head(s)
  week Caco2A2BPapp FractionHumanAbsorption
1    1 6.061924e-05              0.11568186
2    2 6.061924e-05              0.11732401
3    3 6.061924e-05              0.09347046
4    4 6.061924e-05              0.12893540
5    5 5.461941e-05              0.19021858
6    6 5.370623e-05              0.14892154
> View(s) 	# Note: 1

# Note 1: 
#   Display a date in spreadsheet like 
#   window. View is one of the commands that has a much better implementation in 
#   RStudio than in basic R. 

