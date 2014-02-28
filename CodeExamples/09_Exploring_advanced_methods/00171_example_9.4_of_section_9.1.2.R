# example 9.4 of section 9.1.2 
# (example 9.4 of section 9.1.2)  : Exploring advanced methods : Using bagging and random forests to reduce training variance : Using random forests to further improve prediction 
# Title: randomForest variable importances 

> varImp <- importance(fmodel)              	# Note: 1 

> varImp[1:10, ]                           	# Note: 2 
                    non-spam       spam MeanDecreaseAccuracy
word.freq.make      2.096811  3.7304353             4.334207
word.freq.address   3.603167  3.9967031             4.977452
word.freq.all       2.799456  4.9527834             4.924958
word.freq.3d        3.000273  0.4125932             2.917972
word.freq.our       9.037946  7.9421391            10.731509
word.freq.over      5.879377  4.2402613             5.751371
word.freq.remove   16.637390 13.9331691            17.753122
word.freq.internet  7.301055  4.4458342             7.947515
word.freq.order     3.937897  4.3587883             4.866540
word.freq.mail      5.022432  3.4701224             6.103929

varImpPlot(fmodel, type=1)                       	# Note: 3

# Note 1: 
#   Call importance() on the spam 
#   model. 

# Note 2: 
#   The importance() function returns a matrix of 
#   importance measures (larger values = more important). 

# Note 3: 
#   Plot the variable importance as measured by 
#   accuracy change. 

