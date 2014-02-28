# example 8.10 of section 8.1.4 
# (example 8.10 of section 8.1.4)  : Unsupervised methods : Cluster analysis : The k-means algorithm 
# Title: Running k-means with k=5 

> pclusters <- kmeans(pmatrix, kbest.p, nstart=100, iter.max=100)   	# Note: 1 
> summary(pclusters)                                               	# Note: 2 
             Length Class  Mode
cluster      25     -none- numeric
centers      45     -none- numeric
totss         1     -none- numeric
withinss      5     -none- numeric
tot.withinss  1     -none- numeric
betweenss     1     -none- numeric
size          5     -none- numeric

> pclusters$centers                                                	# Note: 3 
       RedMeat  WhiteMeat        Eggs       Milk       Fish
1 -0.807569986 -0.8719354 -1.55330561 -1.0783324 -1.0386379
2  0.006572897 -0.2290150  0.19147892  1.3458748  1.1582546
3 -0.570049402  0.5803879 -0.08589708 -0.4604938 -0.4537795
4  1.011180399  0.7421332  0.94084150  0.5700581 -0.2671539
5 -0.508801956 -1.1088009 -0.41248496 -0.8320414  0.9819154
     Cereals     Starch       Nuts      Fr.Veg
1  1.7200335 -1.4234267  0.9961313 -0.64360439
2 -0.8722721  0.1676780 -0.9553392 -1.11480485
3  0.3181839  0.7857609 -0.2679180  0.06873983
4 -0.6877583  0.2288743 -0.5083895  0.02161979
5  0.1300253 -0.1842010  1.3108846  1.62924487
> pclusters$size                                                  	# Note: 4 
[1] 4 4 5 8 4

> groups <- pclusters$cluster                                      	# Note: 5 
> print_clusters(groups, kbest.p)                                 	# Note: 6 
[1] "cluster 1"
      Country RedMeat Fish Fr.Veg
1     Albania    10.1  0.2    1.7
4    Bulgaria     7.8  1.2    4.2
18    Romania     6.2  1.0    2.8
25 Yugoslavia     4.4  0.6    3.2
[1] "cluster 2"
   Country RedMeat Fish Fr.Veg
6  Denmark    10.6  9.9    2.4
8  Finland     9.5  5.8    1.4
15  Norway     9.4  9.7    2.7
20  Sweden     9.9  7.5    2.0
[1] "cluster 3"
          Country RedMeat Fish Fr.Veg
5  Czechoslovakia     9.7  2.0    4.0
7       E Germany     8.4  5.4    3.6
11        Hungary     5.3  0.3    4.2
16         Poland     6.9  3.0    6.6
23           USSR     9.3  3.0    2.9
[1] "cluster 4"
       Country RedMeat Fish Fr.Veg
2      Austria     8.9  2.1    4.3
3      Belgium    13.5  4.5    4.0
9       France    18.0  5.7    6.5
12     Ireland    13.9  2.2    2.9
14 Netherlands     9.5  2.5    3.7
21 Switzerland    13.1  2.3    4.9
22          UK    17.4  4.3    3.3
24   W Germany    11.4  3.4    3.8
[1] "cluster 5"
    Country RedMeat Fish Fr.Veg
10   Greece    10.2  5.9    6.5
13    Italy     9.0  3.4    6.7
17 Portugal     6.2 14.2    7.9
19    Spain     7.1  7.0    7.2

# Note 1: 
#   Run kmeans() with five clusters (kbest.p=5), 
#   100 random starts, and 100 maximum iterations per 
#   run. 

# Note 2: 
#   kmeans() returns all the sum of squares 
#   measures. 

# Note 3: 
#   pclusters$centers is a matrix whose rows are 
#   the centroids of the clusters. Note that 
#   pclusters$centers is in the scaled coordinates, 
#   not the original protein coordinates. 

# Note 4: 
#   pclusters$size returns the number of points 
#   in each cluster. Generally (though not always) a 
#   good clustering will be fairly well balanced: no 
#   extremely small clusters and no extremely large 
#   ones. 

# Note 5: 
#   pclusters$cluster is a vector of cluster 
#   labels. 

# Note 6: 
#   In this case, kmeans() and hclust() returned 
#   the same clustering. This won’t always be 
#   true. 

