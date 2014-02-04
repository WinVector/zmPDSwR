# informalexample:2_9.1.2 
# informalexample:2 : Exploring advanced methods : Using bagging and random forests to reduce training variance : Using random forests to further improve prediction 
> varImp <- importance(fmodel)              	# Note: 1 

> varImp[1:10, ]                           	# Note: 2 
                     %IncMSE IncNodePurity
word.freq.make      2.296096     2.4266521
word.freq.address   6.019336     2.7132819
word.freq.all       3.252322     3.2194184
word.freq.3d        2.407552     0.9644499
word.freq.our      13.028400    18.6669055
word.freq.over      6.187187     4.5312607
word.freq.remove   33.615974   122.9724112
word.freq.internet  8.615904     8.2494350
word.freq.order     5.905917     3.0257696
word.freq.mail      5.893832     5.7076050

varImpPlot(fmodel, type=1)                       	# Note: 3 

# Note 1: 
#   Call importance() on the spam model 

# Note 2: 
#   The importance() function returns a matrix of importance measures (larger values = more 
#   important) 

# Note 3: 
#   Plot the variable importance as measured by MSE (type=1) 
