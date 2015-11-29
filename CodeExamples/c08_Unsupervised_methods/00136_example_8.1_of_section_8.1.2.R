# example 8.1 of section 8.1.2 
# (example 8.1 of section 8.1.2)  : Unsupervised methods : Cluster analysis : Preparing the data 
# Title: Reading the protein data 

protein <- read.table(“protein.txt”, sep=”\t”, header=TRUE)
summary(protein)
           Country      RedMeat         WhiteMeat           Eggs
 Albania       : 1   Min.   : 4.400   Min.   : 1.400   Min.   :0.500
 Austria       : 1   1st Qu.: 7.800   1st Qu.: 4.900   1st Qu.:2.700
 Belgium       : 1   Median : 9.500   Median : 7.800   Median :2.900
 Bulgaria      : 1   Mean   : 9.828   Mean   : 7.896   Mean   :2.936
 Czechoslovakia: 1   3rd Qu.:10.600   3rd Qu.:10.800   3rd Qu.:3.700
 Denmark       : 1   Max.   :18.000   Max.   :14.000   Max.   :4.700
 (Other)       :19
      Milk            Fish           Cereals          Starch
 Min.   : 4.90   Min.   : 0.200   Min.   :18.60   Min.   :0.600
 1st Qu.:11.10   1st Qu.: 2.100   1st Qu.:24.30   1st Qu.:3.100
 Median :17.60   Median : 3.400   Median :28.00   Median :4.700
 Mean   :17.11   Mean   : 4.284   Mean   :32.25   Mean   :4.276
 3rd Qu.:23.30   3rd Qu.: 5.800   3rd Qu.:40.10   3rd Qu.:5.700
 Max.   :33.70   Max.   :14.200   Max.   :56.70   Max.   :6.500

      Nuts           Fr.Veg
 Min.   :0.700   Min.   :1.400
 1st Qu.:1.500   1st Qu.:2.900
 Median :2.400   Median :3.800
 Mean   :3.072   Mean   :4.136
 3rd Qu.:4.700   3rd Qu.:4.900
 Max.   :7.800   Max.   :7.900

