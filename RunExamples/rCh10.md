``` r
rm(list=ls())
source('runDir.R')
```

``` r
library('ggplot2')
runDir('../CodeExamples/c10_Documentation_and_deployment',
      '../Buzz',last=221)
```

    [1] "############################### start  204 Fri Jun 17 10:43:36 2016"
    [1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR/zmPDSwR/RunExamples/replacements/00204_informalexample_10.1_of_section_10.2.1.R"
    [1] "#####   in directory ../Buzz"

    > # can't "knit" inside a knitr document
    [1] "############################### end  204 Fri Jun 17 10:43:36 2016"
    [1] "############################### start  211 Fri Jun 17 10:43:36 2016"
    [1] "#####  running  ../CodeExamples/c10_Documentation_and_deployment/00211_example_10.7_of_section_10.3.1.R"
    [1] "#####   in directory ../Buzz"

    > # example 10.7 of section 10.3.1 
    > # (example 10.7 of section 10.3.1)  : Documentation and deployment : Using comments and version control for running documentation : Writing effective comments 
    > # Title: Example code comment 
    > 
    > #    Return the pseudo logarithm of x, which is close to
    > # sign(x)*log10(abs(x)) for x such that abs(x) is large
    > # and doesn't "blow up" near zero.  Useful
    > # for transforming wide-range variables that may be negative
    > # (like profit/loss).
    > # See: http://www.win-vector.com/blog
    > #  /2012/03/modeling-trick-the-signed-pseudo-logarithm/
    > #    NB: This transform has the undesirable property of making most
    > # signed distributions appear bimodal around the origin, no matter
    > # what the underlying distribution really looks like.
    > # The argument x is assumed be numeric and can be a vector.
    > pseudoLog10 <- function(x) { asinh(x/2)/log(10) }
    [1] "############################### end  211 Fri Jun 17 10:43:36 2016"
    [1] "############################### start  212 Fri Jun 17 10:43:36 2016"
    [1] "#####  running  ../CodeExamples/c10_Documentation_and_deployment/00212_example_10.8_of_section_10.3.1.R"
    [1] "#####   in directory ../Buzz"

    > # example 10.8 of section 10.3.1 
    > # (example 10.8 of section 10.3.1)  : Documentation and deployment : Using comments and version control for running documentation : Writing effective comments 
    > # Title: Useless comment 
    > 
    > #######################################
    > # Function: addone
    > # Author: John Mount
    > # Version: 1.3.11
    > # Location: RSource/helperFns/addone.R
    > # Date: 10/31/13
    > # Arguments: x
    > # Purpose: Adds one
    > #######################################
    > addone <- function(x) { x + 1 }
    [1] "############################### end  212 Fri Jun 17 10:43:36 2016"
    [1] "############################### start  213 Fri Jun 17 10:43:36 2016"
    [1] "#####  running  ../CodeExamples/c10_Documentation_and_deployment/00213_example_10.9_of_section_10.3.1.R"
    [1] "#####   in directory ../Buzz"

    > # example 10.9 of section 10.3.1 
    > # (example 10.9 of section 10.3.1)  : Documentation and deployment : Using comments and version control for running documentation : Writing effective comments 
    > # Title: Worse than useless comment 
    > 
    > # adds one
    > addtwo <- function(x) { x + 2 }
    [1] "############################### end  213 Fri Jun 17 10:43:36 2016"

``` r
rm(list=ls())
source('runDir.R')
```

``` r
library('ggplot2')
runDir('../CodeExamples/c10_Documentation_and_deployment',
      '../Buzz',first=225)
```

    [1] "############################### start  225 Fri Jun 17 10:43:36 2016"
    [1] "#####  running  ../CodeExamples/c10_Documentation_and_deployment/00225_example_10.18_of_section_10.4.2.R"
    [1] "#####   in directory ../Buzz"

    > # example 10.18 of section 10.4.2 
    > # (example 10.18 of section 10.4.2)  : Documentation and deployment : Deploying models : Deploying models by export 
    > # Title: Exporting the random forest model 
    > 
    > load('thRS500.Rdata')     # Note: 1 

    > library(randomForest)     # Note: 2 

    randomForest 4.6-12

    Type rfNews() to see new features/changes/bug fixes.


    Attaching package: 'randomForest'

    The following object is masked from 'package:ggplot2':

        margin


    > extractTrees <- function(rfModel) {   # Note: 3 
        ei <- function(i) {
           ti <- getTree(rfModel,k=i,labelVar=T)
           ti$nodeid <- 1:dim(ti)[[1]]
           ti$treeid <- i
           ti
        }
        nTrees <- rfModel$ntree
        do.call('rbind',sapply(1:nTrees,ei,simplify=F))
     }

    > write.table(extractTrees(fmodel),     # Note: 4 
        file='rfmodel.tsv',row.names=F,sep='\t',quote=F)

    > # Note 1: 
    > #   Load the saved buzz workspace (includes the 
    > #   random forest model). 
    > 
    > # Note 2: 
    > #   Load the random forest library (loading the 
    > #   workspace doesn’t load the library). 
    > 
    > # Note 3: 
    > #   Define a function that joins the tree tables 
    > #   from the random forest getTree() method into one 
    > #   large table of trees. 
    > 
    > # Note 4: 
    > #   Write the table of trees as a tab-separated 
    > #   values table (easy for other software to 
    > #   read). 
    > 
    [1] "############################### end  225 Fri Jun 17 10:43:37 2016"
