``` r
source('runDir.R')
```

``` r
runDir('../CodeExamples/c02_Loading_data_into_R',
       '../Statlog',last=12)
```

    [1] "############################### start  5 Fri Jun 17 10:32:27 2016"
    [1] "#####  running  ../CodeExamples/c02_Loading_data_into_R/00005_example_2.1_of_section_2.1.1.R"
    [1] "#####   in directory ../Statlog"

    > # example 2.1 of section 2.1.1 
    > # (example 2.1 of section 2.1.1)  : Loading data into R : Working with data from files : Working with well-structured data from files or URLs 
    > # Title: Reading the UCI car data 
    > 
    > uciCar <- read.table(     # Note: 1 
        'http://www.win-vector.com/dfiles/car.data.csv',    # Note: 2 
        sep=',',    # Note: 3 
        header=T    # Note: 4 
        )

    > # Note 1: 
    > #   Command to read from a file or URL and store the result in a new data frame object 
    > #   called 
    > #   uciCar. 
    > 
    > # Note 2: 
    > #   Filename or URL to get the data from. 
    > 
    > # Note 3: 
    > #   Specify the column or field separator as a 
    > #   comma. 
    > 
    > # Note 4: 
    > #   Tell R to expect a header line that defines 
    > #   the data column names. 
    > 
    [1] "############################### end  5 Fri Jun 17 10:32:27 2016"
    [1] "############################### start  6 Fri Jun 17 10:32:27 2016"
    [1] "#####  running  ../CodeExamples/c02_Loading_data_into_R/00006_example_2.2_of_section_2.1.1.R"
    [1] "#####   in directory ../Statlog"

    > # example 2.2 of section 2.1.1 
    > # (example 2.2 of section 2.1.1)  : Loading data into R : Working with data from files : Working with well-structured data from files or URLs 
    > # Title: Exploring the car data 
    > 
    > class(uciCar)
    [1] "data.frame"

    > ## [1] "data.frame"   # Note: 1 
    > summary(uciCar)
       buying      maint       doors     persons     lug_boot    safety   
     high :432   high :432   2    :432   2   :576   big  :576   high:576  
     low  :432   low  :432   3    :432   4   :576   med  :576   low :576  
     med  :432   med  :432   4    :432   more:576   small:576   med :576  
     vhigh:432   vhigh:432   5more:432                                    
       rating    
     acc  : 384  
     good :  69  
     unacc:1210  
     vgood:  65  

    > ##    buying      maint       doors
    > ##  high :432   high :432   2    :432
    > ##  low  :432   low  :432   3    :432
    > ##  med  :432   med  :432   4    :432
    > ##  vhigh:432   vhigh:432   5more:432
    > ##
    > ##  persons     lug_boot    safety
    > ##  2   :576   big  :576   high:576
    > ##  4   :576   med  :576   low :576
    > ##  more:576   small:576   med :576
    > ##
    > ##    rating
    > ##  acc  : 384
    > ##  good :  69
    > ##  unacc:1210
    > ##  vgood:  65
    > 
    > dim(uciCar)
    [1] 1728    7

    > ## [1] 1728    7      # Note: 2
    > 
    > # Note 1: 
    > #   The loaded object uciCar is of type data.frame. 
    > 
    > # Note 2: 
    > #   The [1] is just an output sequence 
    > #   marker. The actual information is this: uciCar has 
    > #   1728 rows and 7 columns. Always try to confirm you 
    > #   got a good parse by at least checking that the 
    > #   number of rows is exactly one fewer than the 
    > #   number of lines of text in the original file. The 
    > #   difference of one is because the column header 
    > #   counts as a line, but not as a data row. 
    > 
    [1] "############################### end  6 Fri Jun 17 10:32:27 2016"
    [1] "############################### start  8 Fri Jun 17 10:32:27 2016"
    [1] "#####  running  ../CodeExamples/c02_Loading_data_into_R/00008_example_2.3_of_section_2.1.2.R"
    [1] "#####   in directory ../Statlog"

    > # example 2.3 of section 2.1.2 
    > # (example 2.3 of section 2.1.2)  : Loading data into R : Working with data from files : Using R on less-structured data 
    > # Title: Loading the credit dataset 
    > 
    > d <- read.table(paste('http://archive.ics.uci.edu/ml/',
        'machine-learning-databases/statlog/german/german.data',sep=''),
        stringsAsFactors=F,header=F)

    > print(d[1:3,])
       V1 V2  V3  V4   V5  V6  V7 V8  V9  V10 V11  V12 V13  V14  V15 V16  V17
    1 A11  6 A34 A43 1169 A65 A75  4 A93 A101   4 A121  67 A143 A152   2 A173
    2 A12 48 A32 A43 5951 A61 A73  2 A92 A101   2 A121  22 A143 A152   1 A173
    3 A14 12 A34 A46 2096 A61 A74  2 A93 A101   3 A121  49 A143 A152   1 A172
      V18  V19  V20 V21
    1   1 A192 A201   1
    2   1 A191 A201   2
    3   2 A191 A201   1
    [1] "############################### end  8 Fri Jun 17 10:32:28 2016"
    [1] "############################### start  9 Fri Jun 17 10:32:28 2016"
    [1] "#####  running  ../CodeExamples/c02_Loading_data_into_R/00009_example_2.4_of_section_2.1.2.R"
    [1] "#####   in directory ../Statlog"

    > # example 2.4 of section 2.1.2 
    > # (example 2.4 of section 2.1.2)  : Loading data into R : Working with data from files : Using R on less-structured data 
    > # Title: Setting column names 
    > 
    > colnames(d) <- c('Status.of.existing.checking.account',
        'Duration.in.month',  'Credit.history', 'Purpose',
        'Credit.amount', 'Savings account/bonds',
        'Present.employment.since',
        'Installment.rate.in.percentage.of.disposable.income',
        'Personal.status.and.sex', 'Other.debtors/guarantors',
        'Present.residence.since', 'Property', 'Age.in.years',
        'Other.installment.plans', 'Housing',
        'Number.of.existing.credits.at.this.bank', 'Job',
        'Number.of.people.being.liable.to.provide.maintenance.for',
        'Telephone', 'foreign.worker', 'Good.Loan')

    > d$Good.Loan <- as.factor(ifelse(d$Good.Loan==1,'GoodLoan','BadLoan'))

    > print(d[1:3,])
      Status.of.existing.checking.account Duration.in.month Credit.history
    1                                 A11                 6            A34
    2                                 A12                48            A32
    3                                 A14                12            A34
      Purpose Credit.amount Savings account/bonds Present.employment.since
    1     A43          1169                   A65                      A75
    2     A43          5951                   A61                      A73
    3     A46          2096                   A61                      A74
      Installment.rate.in.percentage.of.disposable.income
    1                                                   4
    2                                                   2
    3                                                   2
      Personal.status.and.sex Other.debtors/guarantors Present.residence.since
    1                     A93                     A101                       4
    2                     A92                     A101                       2
    3                     A93                     A101                       3
      Property Age.in.years Other.installment.plans Housing
    1     A121           67                    A143    A152
    2     A121           22                    A143    A152
    3     A121           49                    A143    A152
      Number.of.existing.credits.at.this.bank  Job
    1                                       2 A173
    2                                       1 A173
    3                                       1 A172
      Number.of.people.being.liable.to.provide.maintenance.for Telephone
    1                                                        1      A192
    2                                                        1      A191
    3                                                        2      A191
      foreign.worker Good.Loan
    1           A201  GoodLoan
    2           A201   BadLoan
    3           A201  GoodLoan
    [1] "############################### end  9 Fri Jun 17 10:32:28 2016"
    [1] "############################### start  10 Fri Jun 17 10:32:28 2016"
    [1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR/zmPDSwR/RunExamples/replacements/00010_example_2.5_of_section_2.1.2.R"
    [1] "#####   in directory ../Statlog"

    > # Example in book was purposely elipsized, here is complete mapping table
    > 
    > mapping <- list('A11'='... < 0 DM',
      'A12'='0 <= ... < 200 DM',
      'A13'='... >= 200 DM / salary assignments for at least 1 year',
      'A14'='no checking account',
      'A30'='no credits taken/all credits paid back duly',
      'A31'='all credits at this bank paid back duly',
      'A32'='existing credits paid back duly till now',
      'A33'='delay in paying off in the past',
      'A34'='critical account/other credits existing (not at this bank)',
      'A40'='car (new)',
      'A41'='car (used)',
      'A42'='furniture/equipment',
      'A43'='radio/television',
      'A44'='domestic appliances',
      'A45'='repairs',
      'A46'='education',
      'A47'='(vacation - does not exist?)',
      'A48'='retraining',
      'A49'='business',
      'A410'='others',
      'A61'='... < 100 DM',
      'A62'='100 <= ... < 500 DM',
      'A63'='500 <= ... < 1000 DM',
      'A64'='.. >= 1000 DM',
      'A65'='unknown/ no savings account',
      'A71'='unemployed',
      'A72'='... < 1 year',
      'A73'='1 <= ... < 4 years',
      'A74'='4 <= ... < 7 years',
      'A75'='.. >= 7 years',
      'A91'='male : divorced/separated',
      'A92'='female : divorced/separated/married',
      'A93'='male : single',
      'A94'='male : married/widowed',
      'A95'='female : single',
      'A101'='none',
      'A102'='co-applicant',
      'A103'='guarantor',
      'A121'='real estate',
      'A122'='if not A121 : building society savings agreement/life insurance',
      'A123'='if not A121/A122 : car or other, not in attribute 6',
      'A124'='unknown / no property',
      'A141'='bank',
      'A142'='stores',
      'A143'='none',
      'A151'='rent',
      'A152'='own',
      'A153'='for free',
      'A171'='unemployed/ unskilled - non-resident',
      'A172'='unskilled - resident',
      'A173'='skilled employee / official',
      'A174'='management/ self-employed/highly qualified employee/ officer',
      'A191'='none',
      'A192'='yes, registered under the customers name',
      'A201'='yes',
      'A202'='no')
    [1] "############################### end  10 Fri Jun 17 10:32:28 2016"
    [1] "############################### start  11 Fri Jun 17 10:32:28 2016"
    [1] "#####  running  ../CodeExamples/c02_Loading_data_into_R/00011_example_2.6_of_section_2.1.2.R"
    [1] "#####   in directory ../Statlog"

    > # example 2.6 of section 2.1.2 
    > # (example 2.6 of section 2.1.2)  : Loading data into R : Working with data from files : Using R on less-structured data 
    > # Title: Transforming the car data 
    > 
    > for(i in 1:(dim(d))[2]) {                 # Note: 1 
        if(class(d[,i])=='character') {
           d[,i] <- as.factor(as.character(mapping[d[,i]]))     # Note: 2 
        }
     }

    > # Note 1: 
    > #   (dim(d))[2] is the number of columns 
    > #   in the data frame d. 
    > 
    > # Note 2: 
    > #   Note that the indexing operator [] is vectorized. Each step in the for loop remaps an 
    > #   entire column of data through our list. 
    > 
    [1] "############################### end  11 Fri Jun 17 10:32:28 2016"
    [1] "############################### start  12 Fri Jun 17 10:32:28 2016"
    [1] "#####  running  ../CodeExamples/c02_Loading_data_into_R/00012_example_2.7_of_section_2.1.2.R"
    [1] "#####   in directory ../Statlog"

    > # example 2.7 of section 2.1.2 
    > # (example 2.7 of section 2.1.2)  : Loading data into R : Working with data from files : Using R on less-structured data 
    > # Title: Summary of Good.Loan and Purpose 
    > 
    > table(d$Purpose,d$Good.Loan) 
                         
                          BadLoan GoodLoan
      business                 34       63
      car (new)                89      145
      car (used)               17       86
      domestic appliances       4        8
      education                22       28
      furniture/equipment      58      123
      others                    5        7
      radio/television         62      218
      repairs                   8       14
      retraining                1        8

    > ##                       BadLoan GoodLoan
    > ##   business                 34       63
    > ##   car (new)                89      145
    > ##   car (used)               17       86
    > ##   domestic appliances       4        8
    > ##   education                22       28
    > ##   furniture/equipment      58      123
    > ##   others                    5        7
    > ##   radio/television         62      218
    > ##   repairs                   8       14
    > ##   retraining                1        8
    > 
    [1] "############################### end  12 Fri Jun 17 10:32:28 2016"

Step 00016\_example\_2.11\_of\_section\_2.2.2.R requires large files that we don't have the rights to redistributed in their entirety. So we are either running that step, or skipping it and just loading phsample.RDdata .

``` r
runDir('../../CodeExamples/c02_Loading_data_into_R',
       '../PUMS/loadExample',first=13,last=16)
```

    [1] "############################### start  16 Fri Jun 17 10:32:28 2016"
    [1] "#####  running  ../../CodeExamples/c02_Loading_data_into_R/00016_example_2.11_of_section_2.2.2.R"
    [1] "#####   in directory ../PUMS/loadExample"

    > # example 2.11 of section 2.2.2 
    > # (example 2.11 of section 2.2.2)  : Loading data into R : Working with relational databases : Loading data from a database into R 
    > # Title: Loading data into R from a relational database 
    > 
    > options( java.parameters = "-Xmx2g" )     # Note: 1 

    > library(RJDBC)

    Loading required package: DBI

    Loading required package: rJava


    > drv <- JDBC("org.h2.Driver",  # Note: 2 
        "h2-1.3.176.jar",   # Note: 3 
        identifier.quote="'")   # Note: 4 

    > options<-";LOG=0;CACHE_SIZE=65536;LOCK_MODE=0;UNDO_LOG=0"

    > conn <- dbConnect(drv,paste("jdbc:h2:./H2DB",options,sep=''),"u","u")

    > dhus <- dbGetQuery(conn,"SELECT * FROM hus WHERE ORIGRANDGROUP<=1")   # Note: 5 

    > dpus <- dbGetQuery(conn,"SELECT pus.* FROM pus WHERE pus.SERIALNO IN \
        (SELECT DISTINCT hus.SERIALNO FROM hus \
        WHERE hus.ORIGRANDGROUP<=1)")   # Note: 6 

    > dbDisconnect(conn)    # Note: 7 
    [1] TRUE

    > save(dhus,dpus,file='phsample.RData')     # Note: 8

    > # Note 1: 
    > #   Set Java option for extra memory before DB 
    > #   drivers are loaded. 
    > 
    > # Note 2: 
    > #   Specify the name of the database driver, same 
    > #   as in our XML database configuration. 
    > 
    > # Note 3: 
    > #   Specify where to find the implementation of 
    > #   the database driver. 
    > 
    > # Note 4: 
    > #   SQL column names with mixed-case 
    > #   capitalization, special characters, or that 
    > #   collide with reserved words must be quoted. We 
    > #   specify single-quote as the quote we’ll use when 
    > #   quoting column names, which may different than the 
    > #   quote we use for SQL literals. 
    > 
    > # Note 5: 
    > #   Create a data frame called dhus from * 
    > #   (everything) from the database table hus, taking 
    > #   only rows where ORGINRANGGROUP <= 1. The 
    > #   ORGINRANDGROUP column is a random integer from 0 
    > #   through 999 that SQL Screwdriver adds to the rows 
    > #   during data load to facilitate sampling. In this 
    > #   case, we’re taking 2/1000 of the data rows to get 
    > #   a small sample. 
    > 
    > # Note 6: 
    > #   Create a data frame called dpus from the 
    > #   database table pus, taking only records that have 
    > #   a household ID in the set of household IDs we 
    > #   selected from households table hus. 
    > 
    > # Note 7: 
    > #   Disconnect for the database. 
    > 
    > # Note 8: 
    > #   Save the two data frames into a file named 
    > #   phsample.RData, which can be read in with load(). 
    > #   Try help("save") or help("load") for more 
    > #   details. 
    > 
    [1] "############################### end  16 Fri Jun 17 10:32:31 2016"

``` r
# load('../PUMS/phsample.RData')
runDir('../CodeExamples/c02_Loading_data_into_R',
       '../PUMS',first=17)
```

    [1] "############################### start  17 Fri Jun 17 10:32:31 2016"
    [1] "#####  running  ../CodeExamples/c02_Loading_data_into_R/00017_example_2.12_of_section_2.2.3.R"
    [1] "#####   in directory ../PUMS"

    > # example 2.12 of section 2.2.3 
    > # (example 2.12 of section 2.2.3)  : Loading data into R : Working with relational databases : Working with the PUMS data 
    > # Title: Selecting a subset of the Census data 
    > 
    > load('phsample.RData')

    > psub = subset(dpus,with(dpus,(PINCP>1000)&(ESR==1)&
        (PINCP<=250000)&(PERNP>1000)&(PERNP<=250000)&
        (WKHP>=40)&(AGEP>=20)&(AGEP<=50)&
        (PWGTP1>0)&(COW %in% (1:7))&(SCHL %in% (1:24))))    # Note: 1

    > # Note 1: 
    > #   Subset of data rows matching detailed 
    > #   employment conditions 
    > 
    [1] "############################### end  17 Fri Jun 17 10:32:31 2016"
    [1] "############################### start  18 Fri Jun 17 10:32:31 2016"
    [1] "#####  running  ../CodeExamples/c02_Loading_data_into_R/00018_example_2.13_of_section_2.2.3.R"
    [1] "#####   in directory ../PUMS"

    > # example 2.13 of section 2.2.3 
    > # (example 2.13 of section 2.2.3)  : Loading data into R : Working with relational databases : Working with the PUMS data 
    > # Title: Recoding variables 
    > 
    > psub$SEX = as.factor(ifelse(psub$SEX==1,'M','F'))     # Note: 1 

    > psub$SEX = relevel(psub$SEX,'M')  # Note: 2 

    > cowmap <- c("Employee of a private for-profit",
        "Private not-for-profit employee",
        "Local government employee",
        "State government employee",
        "Federal government employee",
        "Self-employed not incorporated",
        "Self-employed incorporated")

    > psub$COW = as.factor(cowmap[psub$COW])    # Note: 3 

    > psub$COW = relevel(psub$COW,cowmap[1])

    > schlmap = c(      # Note: 4 
        rep("no high school diploma",15),
       "Regular high school diploma",
       "GED or alternative credential",
       "some college credit, no degree",
       "some college credit, no degree",
       "Associate's degree",
       "Bachelor's degree",
       "Master's degree",
       "Professional degree",
       "Doctorate degree")

    > psub$SCHL = as.factor(schlmap[psub$SCHL])

    > psub$SCHL = relevel(psub$SCHL,schlmap[1])

    > dtrain = subset(psub,ORIGRANDGROUP >= 500)    # Note: 5 

    > dtest = subset(psub,ORIGRANDGROUP < 500)      # Note: 6

    > # Note 1: 
    > #   Reencode sex from 1/2 to M/F. 
    > 
    > # Note 2: 
    > #   Make the reference sex M, so F encodes a 
    > #   difference from M in models. 
    > 
    > # Note 3: 
    > #   Reencode class of worker info into a more 
    > #   readable form. 
    > 
    > # Note 4: 
    > #   Reencode education info into a more readable 
    > #   form and fewer levels (merge all levels below high 
    > #   school into same encoding). 
    > 
    > # Note 5: 
    > #   Subset of data rows used for model 
    > #   training. 
    > 
    > # Note 6: 
    > #   Subset of data rows used for model 
    > #   testing. 
    > 
    [1] "############################### end  18 Fri Jun 17 10:32:31 2016"
    [1] "############################### start  19 Fri Jun 17 10:32:31 2016"
    [1] "#####  running  ../CodeExamples/c02_Loading_data_into_R/00019_example_2.14_of_section_2.2.3.R"
    [1] "#####   in directory ../PUMS"

    > # example 2.14 of section 2.2.3 
    > # (example 2.14 of section 2.2.3)  : Loading data into R : Working with relational databases : Working with the PUMS data 
    > # Title: Summarizing the classifications of work 
    > 
    > summary(dtrain$COW)
    Employee of a private for-profit      Federal government employee 
                                 423                               21 
           Local government employee  Private not-for-profit employee 
                                  39                               55 
          Self-employed incorporated   Self-employed not incorporated 
                                  17                               16 
           State government employee 
                                  24 

    > ## Employee of a private for-profit      Federal government employee
    > ##                              423                               21
    > ##        Local government employee  Private not-for-profit employee
    > ##                               39                               55
    > ##       Self-employed incorporated   Self-employed not incorporated
    > ##                               17                               16
    > ##        State government employee
    > ##                               24
    > 
    [1] "############################### end  19 Fri Jun 17 10:32:31 2016"
