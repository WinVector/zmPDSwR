# example 8.4 of section 8.1.3 
# (example 8.4 of section 8.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: Extracting the clusters found by hclust() 

groups <- cutree(pfit, k=5)

print_clusters <- function(labels, k) {             	# Note: 1 
  for(i in 1:k) {
    print(paste("cluster", i))
    print(protein[labels==i,c("Country","RedMeat","Fish","Fr.Veg")])
  }
}

> print_clusters(groups, 5)
[1] "cluster 1"
      Country RedMeat Fish Fr.Veg
1     Albania    10.1  0.2    1.7
4    Bulgaria     7.8  1.2    4.2
18    Romania     6.2  1.0    2.8
25 Yugoslavia     4.4  0.6    3.2
[1] "cluster 2"
       Country RedMeat Fish Fr.Veg
2      Austria     8.9  2.1    4.3
3      Belgium    13.5  4.5    4.0
9       France    18.0  5.7    6.5
12     Ireland    13.9  2.2    2.9
14 Netherlands     9.5  2.5    3.7
21 Switzerland    13.1  2.3    4.9
22          UK    17.4  4.3    3.3
24   W Germany    11.4  3.4    3.8
[1] "cluster 3"
          Country RedMeat Fish Fr.Veg
5  Czechoslovakia     9.7  2.0    4.0
7       E Germany     8.4  5.4    3.6
11        Hungary     5.3  0.3    4.2
16         Poland     6.9  3.0    6.6
23           USSR     9.3  3.0    2.9
[1] "cluster 4"
   Country RedMeat Fish Fr.Veg
6  Denmark    10.6  9.9    2.4
8  Finland     9.5  5.8    1.4
15  Norway     9.4  9.7    2.7
20  Sweden     9.9  7.5    2.0
[1] "cluster 5"
    Country RedMeat Fish Fr.Veg
10   Greece    10.2  5.9    6.5
13    Italy     9.0  3.4    6.7
17 Portugal     6.2 14.2    7.9
19    Spain     7.1  7.0    7.2

# Note 1: 
#   A convenience function for printing out the 
#   countries in each cluster, along with the values 
#   for red meat, fish, and fruit/vegetable 
#   consumption. We’ll use this function throughout 
#   this section. Note that the function is hardcoded 
#   for the protein dataset. 

