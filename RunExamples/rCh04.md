``` r
source('runDir.R')
```

``` r
custdata <- read.table('../Custdata/custdata.tsv',
                       header=TRUE,sep='\t')
runDir('../CodeExamples/c04_Managing_data',
       '../Custdata',last=55)
```

    [1] "############################### start  42 Fri Jun 17 10:32:48 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00042_example_4.1_of_section_4.1.1.R"
    [1] "#####   in directory ../Custdata"

    > # example 4.1 of section 4.1.1 
    > # (example 4.1 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 
    > # Title: Checking locations of missing data 
    > 
    > custdata <- read.table('custdata.tsv',
        header=TRUE,sep='\t')

    > summary(custdata[is.na(custdata$housing.type),    # Note: 1 
                        c("recent.move","num.vehicles")])   # Note: 2 
     recent.move     num.vehicles
     Mode:logical   Min.   : NA  
     NA's:56        1st Qu.: NA  
                    Median : NA  
                    Mean   :NaN  
                    3rd Qu.: NA  
                    Max.   : NA  
                    NA's   :56   

    > ##  recent.move     num.vehicles      # Note: 3 
    > ##  Mode:logical   Min.   : NA
    > ##  NA's:56        1st Qu.: NA
    > ##                 Median : NA
    > ##                 Mean   :NaN
    > ##                 3rd Qu.: NA
    > ##                 Max.   : NA
    > ##                 NA's   :56
    > 
    > # Note 1: 
    > #   Restrict to the rows where housing.type is 
    > #   NA. 
    > 
    > # Note 2: 
    > #   Look only at the columns recent.move and 
    > #   num.vehicles. 
    > 
    > # Note 3: 
    > #   The output: all NAs. All the missing data 
    > #   comes from the same rows. 
    > 
    [1] "############################### end  42 Fri Jun 17 10:32:48 2016"
    [1] "############################### start  43 Fri Jun 17 10:32:48 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00043_example_4.2_of_section_4.1.1.R"
    [1] "#####   in directory ../Custdata"

    > # example 4.2 of section 4.1.1 
    > # (example 4.2 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 
    > # Title: Remapping NA to a level 
    > 
    > custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),   # Note: 1 
                                        "missing",                      # Note: 2 
                                        ifelse(custdata$is.employed==T,     # Note: 3 
                                               "employed",
                                               "not employed"))     # Note: 4 

    > summary(as.factor(custdata$is.employed.fix))  # Note: 5 
        employed      missing not employed 
             599          328           73 

    > ##     employed      missing not employed
    > ##          599          328           73
    > 
    > # Note 1: 
    > #   If is.employed value is missing... 
    > 
    > # Note 2: 
    > #   ...assign the value "missing". 
    > #   Otherwise... 
    > 
    > # Note 3: 
    > #   ...if is.employed==TRUE, assign the value 
    > #   "employed"... 
    > 
    > # Note 4: 
    > #   ...or the value "not employed". 
    > 
    > # Note 5: 
    > #   The transformation has turned the variable 
    > #   type from factor to string. You can change it back 
    > #   with the as.factor() function. 
    > 
    [1] "############################### end  43 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  44 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00044_informalexample_4.1_of_section_4.1.1.R"
    [1] "#####   in directory ../Custdata"

    > # informalexample 4.1 of section 4.1.1 
    > # (informalexample 4.1 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 
    > 
    > custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),
                       "not in active workforce",
                        ifelse(custdata$is.employed==T,
                                        "employed",
                                         "not employed"))
    [1] "############################### end  44 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  45 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00045_informalexample_4.2_of_section_4.1.1.R"
    [1] "#####   in directory ../Custdata"

    > # informalexample 4.2 of section 4.1.1 
    > # (informalexample 4.2 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 
    > 
    > summary(custdata$Income)
    Length  Class   Mode 
         0   NULL   NULL 

    > ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's
    > ##       0   25000   45000   66200   82000  615000     328
    > 
    [1] "############################### end  45 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  46 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00046_informalexample_4.3_of_section_4.1.1.R"
    [1] "#####   in directory ../Custdata"

    > # informalexample 4.3 of section 4.1.1 
    > # (informalexample 4.3 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 
    > 
    > meanIncome <- mean(custdata$Income, na.rm=T)  # Note: 1 

    Warning in mean.default(custdata$Income, na.rm = T): argument is not
    numeric or logical: returning NA


    > Income.fix <- ifelse(is.na(custdata$Income),
                            meanIncome,
                            custdata$Income)

    Warning in is.na(custdata$Income): is.na() applied to non-(list or vector)
    of type 'NULL'


    > summary(Income.fix)
       Mode    NA's 
    logical       0 

    > ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
    > ##       0   35000   66200   66200   66200  615000
    > 
    > # Note 1: 
    > #   Don’t forget the argument "na.rm=T"! 
    > #   Otherwise, the mean() function will include the 
    > #   NAs by default, and meanIncome will be NA. 
    > 
    [1] "############################### end  46 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  47 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00047_example_4.3_of_section_4.1.1.R"
    [1] "#####   in directory ../Custdata"

    > # example 4.3 of section 4.1.1 
    > # (example 4.3 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 
    > # Title: Converting missing numeric data to a level 
    > 
    > breaks <-c(0, 10000, 50000, 100000, 250000, 1000000)              # Note: 1 

    > Income.groups <- cut(custdata$income,
                           breaks=breaks, include.lowest=T)     # Note: 2 

    > summary(Income.groups)                                            # Note: 3 
          [0,1e+04]   (1e+04,5e+04]   (5e+04,1e+05] (1e+05,2.5e+05] 
                184             469             215             105 
    (2.5e+05,1e+06]            NA's 
                 26               1 

    > ##  [0,1e+04] (1e+04,5e+04] (5e+04,1e+05] (1e+05,2.5e+05] (2.5e+05,1e+06]
    > ##         63           312           178              98              21
    > ##       NA's
    > ##        328
    > 
    > Income.groups <- as.character(Income.groups)                      # Note: 4 

    > Income.groups <- ifelse(is.na(Income.groups),                     # Note: 5 
                           "no income", Income.groups)

    > summary(as.factor(Income.groups))
      (1e+04,5e+04] (1e+05,2.5e+05] (2.5e+05,1e+06]   (5e+04,1e+05] 
                469             105              26             215 
          [0,1e+04]       no income 
                184               1 

    > ##  (1e+04,5e+04] (1e+05,2.5e+05] (2.5e+05,1e+06]  (5e+04,1e+05]  [0,1e+04]
    > ##            312              98              21            178         63
    > ##      no income
    > ##            328
    > 
    > # Note 1: 
    > #   Select some income ranges of interest. To 
    > #   use the cut() function, the upper and lower bounds 
    > #   should encompass the full income range of the 
    > #   data. 
    > 
    > # Note 2: 
    > #   Cut the data into income ranges. The 
    > #   include.lowest=T argument makes sure that zero 
    > #   income data is included in the lowest income range 
    > #   category. By default it would be excluded. 
    > 
    > # Note 3: 
    > #   The cut() function produces factor 
    > #   variables. Note the NAs are preserved. 
    > 
    > # Note 4: 
    > #   To preserve the category names before adding 
    > #   a new category, convert the variables to strings. 
    > 
    > # Note 5: 
    > #   Add the "no income" category to replace the 
    > #   NAs. 
    > 
    [1] "############################### end  47 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  48 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00048_example_4.4_of_section_4.1.1.R"
    [1] "#####   in directory ../Custdata"

    > # example 4.4 of section 4.1.1 
    > # (example 4.4 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 
    > # Title: Tracking original NAs with an extra categorical variable 
    > 
    > missingIncome <- is.na(custdata$Income)   # Note: 1 

    Warning in is.na(custdata$Income): is.na() applied to non-(list or vector)
    of type 'NULL'


    > Income.fix <- ifelse(is.na(custdata$Income), 0, custdata$Income)  # Note: 2

    Warning in is.na(custdata$Income): is.na() applied to non-(list or vector)
    of type 'NULL'


    > # Note 1: 
    > #   The missingIncome variable lets you 
    > #   differentiate the two kinds of zeros in the data: 
    > #   the ones that you are about to add, and the ones 
    > #   that were already there. 
    > 
    > # Note 2: 
    > #   Replace the NAs with zeros. 
    > 
    [1] "############################### end  48 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  49 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00049_example_4.5_of_section_4.1.2.R"
    [1] "#####   in directory ../Custdata"

    > # example 4.5 of section 4.1.2 
    > # (example 4.5 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 
    > # Title: Normalizing income by state 
    > 
    > medianincome <- aggregate(income~state.of.res,custdata,FUN=median)

    > colnames(medianincome) <- c('State','Median.Income')

    > summary(medianincome)     # Note: 1 
            State    Median.Income  
     Alabama   : 1   Min.   :    0  
     Alaska    : 1   1st Qu.:27575  
     Arizona   : 1   Median :35685  
     Arkansas  : 1   Mean   :35362  
     California: 1   3rd Qu.:40375  
     Colorado  : 1   Max.   :94700  
     (Other)   :44                  

    > ##         State    Median.Income
    > ##            : 1   Min.   :37427
    > ##  Alabama   : 1   1st Qu.:47483
    > ##  Alaska    : 1   Median :52274
    > ##  Arizona   : 1   Mean   :52655
    > ##  Arkansas  : 1   3rd Qu.:57195
    > ##  California: 1   Max.   :68187
    > ##  (Other)   :46
    > 
    >         
    > custdata <- merge(custdata, medianincome,
                        by.x="state.of.res", by.y="State")      # Note: 2 

    > summary(custdata[,c("state.of.res", "income", "Median.Income")])  # Note: 3 
           state.of.res     income       Median.Income  
     California  :100   Min.   : -8700   Min.   :    0  
     New York    : 71   1st Qu.: 14600   1st Qu.:31600  
     Pennsylvania: 70   Median : 35000   Median :35780  
     Texas       : 56   Mean   : 53505   Mean   :34853  
     Michigan    : 52   3rd Qu.: 67000   3rd Qu.:38500  
     Ohio        : 51   Max.   :615000   Max.   :94700  
     (Other)     :600                                   

    > ##        state.of.res     income       Median.Income
    > ##  California  :100   Min.   : -8700   Min.   :37427
    > ##  New York    : 71   1st Qu.: 14600   1st Qu.:44819
    > ##  Pennsylvania: 70   Median : 35000   Median :50977
    > ##  Texas       : 56   Mean   : 53505   Mean   :51161
    > ##  Michigan    : 52   3rd Qu.: 67000   3rd Qu.:55559
    > ##  Ohio        : 51   Max.   :615000   Max.   :68187
    > ##  (Other)     :600
    > 
    > custdata$income.norm <- with(custdata, income/Median.Income)  # Note: 4 

    > summary(custdata$income.norm)
       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    -0.1933  0.4479  1.0000  1.5740  1.8990 17.0800       1 

    > ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
    > ## -0.1791  0.2729  0.6992  1.0820  1.3120 11.6600
    > 
    > # Note 1: 
    > #   medianincome is a data frame of median 
    > #   income by state. 
    > 
    > # Note 2: 
    > #   Merge median income information into the 
    > #   custdata data frame by matching the column 
    > #   custdata$state.of.res to the column 
    > #   medianincome$State. 
    > 
    > # Note 3: 
    > #   Median.Income is now part of custdata. 
    > 
    > # Note 4: 
    > #   Normalize income by Median.Income. 
    > 
    [1] "############################### end  49 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  50 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00050_informalexample_4.4_of_section_4.1.2.R"
    [1] "#####   in directory ../Custdata"

    > # informalexample 4.4 of section 4.1.2 
    > # (informalexample 4.4 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 
    > 
    > custdata$income.lt.20K <- custdata$income < 20000

    > summary(custdata$income.lt.20K)
       Mode   FALSE    TRUE    NA's 
    logical     678     322       0 

    > ##    Mode   FALSE    TRUE    NA's
    > ## logical     678     322       0
    > 
    [1] "############################### end  50 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  51 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00051_example_4.6_of_section_4.1.2.R"
    [1] "#####   in directory ../Custdata"

    > # example 4.6 of section 4.1.2 
    > # (example 4.6 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 
    > # Title: Converting age into ranges 
    > 
    > brks <- c(0, 25, 65, Inf)     # Note: 1 

    > custdata$age.range <- cut(custdata$age,
         breaks=brks, include.lowest=T)     # Note: 2 

    > summary(custdata$age.range)   # Note: 3 
      [0,25]  (25,65] (65,Inf] 
          56      732      212 

    > ##   [0,25]  (25,65] (65,Inf]
    > ##       56      732      212
    > 
    > # Note 1: 
    > #   Select the age ranges of interest. The upper 
    > #   and lower bounds should encompass the full range 
    > #   of the data. 
    > 
    > # Note 2: 
    > #   Cut the data into age ranges. The 
    > #   include.lowest=T argument makes sure that zero age 
    > #   data is included in the lowest age range category. 
    > #   By default it would be excluded. 
    > 
    > # Note 3: 
    > #   The output of cut() is a factor variable. 
    > 
    [1] "############################### end  51 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  52 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00052_example_4.7_of_section_4.1.2.R"
    [1] "#####   in directory ../Custdata"

    > # example 4.7 of section 4.1.2 
    > # (example 4.7 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 
    > # Title: Centering on mean age 
    > 
    > summary(custdata$age)
       Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        0.0    38.0    50.0    51.7    64.0   146.7 

    > ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
    > ##     0.0    38.0    50.0    51.7    64.0   146.7
    > meanage <- mean(custdata$age)

    > custdata$age.normalized <- custdata$age/meanage

    > summary(custdata$age.normalized)
       Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
     0.0000  0.7350  0.9671  1.0000  1.2380  2.8370 

    > ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
    > ##  0.0000  0.7350  0.9671  1.0000  1.2380  2.8370
    > 
    [1] "############################### end  52 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  53 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00053_example_4.8_of_section_4.1.2.R"
    [1] "#####   in directory ../Custdata"

    > # example 4.8 of section 4.1.2 
    > # (example 4.8 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 
    > # Title: Summarizing age 
    > 
    > summary(custdata$age)
       Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        0.0    38.0    50.0    51.7    64.0   146.7 

    > ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
    > ##     0.0    38.0    50.0    51.7    64.0   146.7
    > meanage <- mean(custdata$age)     # Note: 1 

    > stdage <- sd(custdata$age)        # Note: 2 

    > meanage
    [1] 51.69981

    > ## [1] 51.69981
    > stdage
    [1] 18.86343

    > ## [1] 18.86343
    > custdata$age.normalized <- (custdata$age-meanage)/stdage  # Note: 3 

    > summary(custdata$age.normalized)
        Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    -2.74100 -0.72630 -0.09011  0.00000  0.65210  5.03500 

    > ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
    > ## -2.74100 -0.72630 -0.09011  0.00000  0.65210  5.03500
    > 
    > # Note 1: 
    > #   Take the mean. 
    > 
    > # Note 2: 
    > #   Take the standard deviation. 
    > 
    > # Note 3: 
    > #   Use the mean value as the origin (or 
    > #   reference point) and rescale the distance from the 
    > #   mean by the standard deviation. 
    > 
    [1] "############################### end  53 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  54 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00054_informalexample_4.5_of_section_4.1.2.R"
    [1] "#####   in directory ../Custdata"

    > # informalexample 4.5 of section 4.1.2 
    > # (informalexample 4.5 of section 4.1.2)  : Managing data : Cleaning data : Data transformations 
    > 
    > signedlog10 <- function(x) {
       ifelse(abs(x) <= 1, 0, sign(x)*log10(abs(x)))
     }
    [1] "############################### end  54 Fri Jun 17 10:32:49 2016"
    [1] "############################### start  55 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00055_example_4.9_of_section_4.2.2.R"
    [1] "#####   in directory ../Custdata"

    > # example 4.9 of section 4.2.2 
    > # (example 4.9 of section 4.2.2)  : Managing data : Sampling for modeling and validation : Creating a sample group column 
    > # Title: Splitting into test and training using a random group mark 
    > 
    > custdata$gp <- runif(dim(custdata)[1])    # Note: 1 

    > testSet <- subset(custdata, custdata$gp <= 0.1)   # Note: 2 

    > trainingSet <- subset(custdata, custdata$gp > 0.1)    # Note: 3 

    > dim(testSet)[1]
    [1] 105

    > ## [1] 93
    > dim(trainingSet)[1]
    [1] 895

    > ## [1] 907
    > 
    > # Note 1: 
    > #   dim(custdata) returns the number of rows and 
    > #   columns of the data frame as a vector, so 
    > #   dim(custdata)[1] returns the number of rows. 
    > 
    > # Note 2: 
    > #   Here we generate a test set of about 10% of 
    > #   the data (93 customers—a little over 9%, actually) 
    > #   and train on the remaining 90%. 
    > 
    > # Note 3: 
    > #   Here we generate a training using the 
    > #   remaining data. 
    > 
    [1] "############################### end  55 Fri Jun 17 10:32:49 2016"

``` r
rm(list=ls())
source('runDir.R')
load('../NotionalData/exampleData.rData')
runDir('../CodeExamples/c04_Managing_data',
       '../NotionalData',first=56)
```

    [1] "############################### start  56 Fri Jun 17 10:32:49 2016"
    [1] "#####  running  ../CodeExamples/c04_Managing_data/00056_example_4.10_of_section_4.2.3.R"
    [1] "#####   in directory ../NotionalData"

    > # example 4.10 of section 4.2.3 
    > # (example 4.10 of section 4.2.3)  : Managing data : Sampling for modeling and validation : Record grouping 
    > # Title: Ensuring test/train split doesn’t split inside a household 
    > 
    > hh <- unique(hhdata$household_id)     # Note: 1 

    > households <- data.frame(household_id = hh, gp = runif(length(hh)))   # Note: 2 

    > hhdata <- merge(hhdata, households, by="household_id")    # Note: 3

    > # Note 1: 
    > #   Get all unique household IDs from your data 
    > #   frame. 
    > 
    > # Note 2: 
    > #   Create a temporary data frame of household IDs 
    > #   and a uniformly random number from 0 to 1. 
    > 
    > # Note 3: 
    > #   Merge new random sample group column back into 
    > #   original data frame. 
    > 
    [1] "############################### end  56 Fri Jun 17 10:32:49 2016"
