KDD2009vtreat
================
John Mount

Practical data science with R built chapter 6 built a number of single variable models. In Listing 6.11 it used an ad-hoc entropy based out of sample effect size estimate for variable selection. This likely (though it isn't completely rigorous) picked variables conservatively.

We show here how to repeat this work on the KDD2009 dataset using more standard techniques more quickly. For vtreat details see: <http://www.win-vector.com/blog/2014/08/vtreat-designing-a-package-for-variable-treatment/> and Chapter 6 of Practical Data Science with R: <http://www.amazon.com/Practical-Data-Science/dp/1617291560> For details on data see: <https://github.com/WinVector/zmPDSwR/tree/master/KDD2009> There is an issue that any data row used to build the single variable models isn't exchangable with future unseen rows for the purposes of scoring and training. So the most hygienic way to work is to use one subset of data to build the single variable models, and then another to built the composite model, and a third for scoring. In particular models trained using rows used to build sub-models think the sub-models have large effects that the sub-models will in the future, and under-estimate degrees of freedom of complicated sub-models.

``` r
date()
```

    ## [1] "Mon Dec 17 11:20:04 2018"

``` r
#load some libraries
library('vtreat')
packageVersion("vtreat")
```

    ## [1] '1.3.3'

``` r
library('WVPlots') 

library('parallel')
library('xgboost')



# load the data as in the book
# change this path to match your directory structure
#dir = '~/Documents/work/PracticalDataScienceWithR/zmPDSwR/KDD2009/' 
dir = '~/Documents/work/zmPDSwR/KDD2009/' 


d = read.table(paste(dir,'orange_small_train.data.gz',sep=''),
                header=T,sep='\t',na.strings=c('NA',''), 
               stringsAsFactors=FALSE)
churn = read.table(paste(dir,'orange_small_train_churn.labels.txt',sep=''),
                    header=F,sep='\t')
d$churn = churn$V1
appetency = read.table(paste(dir,'orange_small_train_appetency.labels.txt',sep=''),
                        header=F,sep='\t')
d$appetency = appetency$V1
upselling = read.table(paste(dir,'orange_small_train_upselling.labels.txt',sep=''),
                        header=F,sep='\t')
d$upselling = upselling$V1
set.seed(729375)
d$rgroup = runif(dim(d)[[1]])
dTrain = subset(d,rgroup<=0.9)  # set for building models and impact coding
dTest = subset(d,rgroup>0.9) # set for evaluation
rm(list=c('d','churn','appetency','upselling','dir'))

dim(dTrain)
```

    ## [1] 45028   234

``` r
dim(dTest)
```

    ## [1] 4972  234

``` r
outcomes = c('churn','appetency','upselling')
vars = setdiff(colnames(dTrain),
                c(outcomes,'rgroup'))
yName = 'churn'
yTarget = 1

set.seed(239525)

ncore <- parallel::detectCores()
cl = parallel::makeCluster(ncore)
date()
```

    ## [1] "Mon Dec 17 11:20:09 2018"

``` r
date()
```

    ## [1] "Mon Dec 17 11:20:09 2018"

``` r
var_values <- vtreat::value_variables_C(dTrain,
    vars,yName,yTarget,
    smFactor=2.0, 
    parallelCluster=cl
    )

knitr::kable(var_values)
```

|        |           rsq|  count|        sig| var    |
|--------|-------------:|------:|----------:|:-------|
| Var1   |  2.376463e-05|      4|  1.0000000| Var1   |
| Var10  |  9.813199e-04|      4|  0.0000057| Var10  |
| Var100 |  3.502919e-05|      4|  1.0000000| Var100 |
| Var101 |  6.009046e-04|      4|  0.0006439| Var101 |
| Var102 |  1.742866e-04|      4|  0.1685190| Var102 |
| Var103 |  9.813199e-04|      4|  0.0000057| Var103 |
| Var104 |  2.278508e-04|      4|  0.0805808| Var104 |
| Var105 |  2.278508e-04|      4|  0.0805808| Var105 |
| Var106 |  9.593148e-04|      4|  0.0000074| Var106 |
| Var107 |  9.813199e-04|      4|  0.0000057| Var107 |
| Var108 |  2.411380e-05|      4|  1.0000000| Var108 |
| Var109 |  1.988511e-04|      4|  0.1198059| Var109 |
| Var11  |  8.812072e-04|      4|  0.0000195| Var11  |
| Var110 |  1.029613e-04|      4|  0.4731582| Var110 |
| Var111 |  8.364368e-04|      4|  0.0000340| Var111 |
| Var112 |  2.772074e-03|      4|  0.0000000| Var112 |
| Var113 |  7.103110e-03|      3|  0.0000000| Var113 |
| Var114 |  8.842007e-04|      4|  0.0000188| Var114 |
| Var115 |  2.278508e-04|      4|  0.0805808| Var115 |
| Var116 |  2.376463e-05|      4|  1.0000000| Var116 |
| Var117 |  9.593148e-04|      4|  0.0000074| Var117 |
| Var118 |  5.017689e-07|      1|  0.9131691| Var118 |
| Var119 |  2.674282e-03|      4|  0.0000000| Var119 |
| Var12  |  3.286502e-05|      4|  1.0000000| Var12  |
| Var120 |  9.813199e-04|      4|  0.0000057| Var120 |
| Var121 |  2.376463e-05|      4|  1.0000000| Var121 |
| Var122 |  8.842007e-04|      4|  0.0000188| Var122 |
| Var123 |  2.772074e-03|      4|  0.0000000| Var123 |
| Var124 |  9.593148e-04|      4|  0.0000074| Var124 |
| Var125 |  2.063834e-03|      4|  0.0000000| Var125 |
| Var126 |  1.382784e-02|      4|  0.0000000| Var126 |
| Var127 |  5.822901e-04|      4|  0.0008141| Var127 |
| Var128 |  5.822901e-04|      4|  0.0008141| Var128 |
| Var129 |  2.376463e-05|      4|  1.0000000| Var129 |
| Var13  |  5.312771e-03|      4|  0.0000000| Var13  |
| Var130 |  8.812072e-04|      4|  0.0000195| Var130 |
| Var131 |  8.857586e-05|      4|  0.5896059| Var131 |
| Var132 |  2.772074e-03|      4|  0.0000000| Var132 |
| Var133 |  2.772074e-03|      4|  0.0000000| Var133 |
| Var134 |  2.772074e-03|      4|  0.0000000| Var134 |
| Var135 |  9.593148e-04|      4|  0.0000074| Var135 |
| Var136 |  6.724954e-05|      4|  0.8272622| Var136 |
| Var137 |  2.376463e-05|      4|  1.0000000| Var137 |
| Var138 |  9.593148e-04|      4|  0.0000074| Var138 |
| Var139 |  9.813199e-04|      4|  0.0000057| Var139 |
| Var14  |  8.812072e-04|      4|  0.0000195| Var14  |
| Var140 |  2.972593e-03|      4|  0.0000000| Var140 |
| Var142 |  8.540294e-05|      4|  0.6194248| Var142 |
| Var143 |  2.772074e-03|      4|  0.0000000| Var143 |
| Var144 |  5.421069e-03|      4|  0.0000000| Var144 |
| Var145 |  9.593148e-04|      4|  0.0000074| Var145 |
| Var146 |  9.813199e-04|      4|  0.0000057| Var146 |
| Var147 |  9.813199e-04|      4|  0.0000057| Var147 |
| Var148 |  9.813199e-04|      4|  0.0000057| Var148 |
| Var149 |  3.035956e-04|      4|  0.0292566| Var149 |
| Var150 |  9.593148e-04|      4|  0.0000074| Var150 |
| Var151 |  6.334417e-04|      4|  0.0004277| Var151 |
| Var152 |  9.593148e-04|      4|  0.0000074| Var152 |
| Var153 |  2.772074e-03|      4|  0.0000000| Var153 |
| Var154 |  2.376463e-05|      4|  1.0000000| Var154 |
| Var155 |  9.593148e-04|      4|  0.0000074| Var155 |
| Var156 |  1.905424e-05|      4|  1.0000000| Var156 |
| Var157 |  8.364368e-04|      4|  0.0000340| Var157 |
| Var158 |  6.009046e-04|      4|  0.0006439| Var158 |
| Var159 |  8.842007e-04|      4|  0.0000188| Var159 |
| Var16  |  9.813199e-04|      4|  0.0000057| Var16  |
| Var160 |  2.772074e-03|      4|  0.0000000| Var160 |
| Var161 |  9.593148e-04|      4|  0.0000074| Var161 |
| Var162 |  8.842007e-04|      4|  0.0000188| Var162 |
| Var163 |  2.772074e-03|      4|  0.0000000| Var163 |
| Var164 |  9.593148e-04|      4|  0.0000074| Var164 |
| Var165 |  6.009046e-04|      4|  0.0006439| Var165 |
| Var166 |  9.813199e-04|      4|  0.0000057| Var166 |
| Var168 |  2.632379e-04|      4|  0.0500202| Var168 |
| Var17  |  9.593148e-04|      4|  0.0000074| Var17  |
| Var170 |  8.842007e-04|      4|  0.0000188| Var170 |
| Var171 |  5.822901e-04|      4|  0.0008141| Var171 |
| Var172 |  9.813199e-04|      4|  0.0000057| Var172 |
| Var173 |  2.772074e-03|      4|  0.0000000| Var173 |
| Var174 |  9.593148e-04|      4|  0.0000074| Var174 |
| Var176 |  8.812072e-04|      4|  0.0000195| Var176 |
| Var177 |  8.842007e-04|      4|  0.0000188| Var177 |
| Var178 |  1.729184e-04|      4|  0.1717806| Var178 |
| Var179 |  9.593148e-04|      4|  0.0000074| Var179 |
| Var18  |  9.593148e-04|      4|  0.0000074| Var18  |
| Var180 |  2.376463e-05|      4|  1.0000000| Var180 |
| Var181 |  2.772074e-03|      4|  0.0000000| Var181 |
| Var182 |  9.593148e-04|      4|  0.0000074| Var182 |
| Var183 |  8.842007e-04|      4|  0.0000188| Var183 |
| Var184 |  8.842007e-04|      4|  0.0000188| Var184 |
| Var186 |  2.376463e-05|      4|  1.0000000| Var186 |
| Var187 |  2.376463e-05|      4|  1.0000000| Var187 |
| Var188 |  8.842007e-04|      4|  0.0000188| Var188 |
| Var189 |  1.215778e-02|      4|  0.0000000| Var189 |
| Var19  |  9.593148e-04|      4|  0.0000074| Var19  |
| Var190 |  7.148827e-05|      4|  0.7722865| Var190 |
| Var191 |  5.823458e-04|      2|  0.0004068| Var191 |
| Var192 |  7.538690e-03|      2|  0.0000000| Var192 |
| Var193 |  7.297381e-03|      2|  0.0000000| Var193 |
| Var194 |  6.782668e-04|      2|  0.0001219| Var194 |
| Var195 |  8.627715e-04|      2|  0.0000123| Var195 |
| Var196 |  1.183184e-04|      2|  0.1880904| Var196 |
| Var197 |  9.815205e-04|      2|  0.0000028| Var197 |
| Var198 |  4.063878e-03|      2|  0.0000000| Var198 |
| Var199 |  8.723234e-03|      2|  0.0000000| Var199 |
| Var2   |  8.842007e-04|      4|  0.0000188| Var2   |
| Var200 |  5.221674e-03|      2|  0.0000000| Var200 |
| Var201 |  6.700742e-04|      2|  0.0001351| Var201 |
| Var202 |  3.211780e-03|      2|  0.0000000| Var202 |
| Var203 |  2.116357e-04|      2|  0.0502565| Var203 |
| Var204 |  1.544907e-03|      2|  0.0000000| Var204 |
| Var205 |  7.465653e-03|      2|  0.0000000| Var205 |
| Var206 |  1.256862e-02|      2|  0.0000000| Var206 |
| Var207 |  5.645282e-03|      2|  0.0000000| Var207 |
| Var208 |  8.615999e-05|      2|  0.3060790| Var208 |
| Var21  |  2.674282e-03|      4|  0.0000000| Var21  |
| Var210 |  3.973929e-03|      2|  0.0000000| Var210 |
| Var211 |  1.984996e-03|      2|  0.0000000| Var211 |
| Var212 |  9.894754e-03|      2|  0.0000000| Var212 |
| Var213 |  8.374278e-04|      2|  0.0000168| Var213 |
| Var214 |  5.221674e-03|      2|  0.0000000| Var214 |
| Var215 |  1.897240e-05|      2|  1.0000000| Var215 |
| Var216 |  4.231456e-03|      2|  0.0000000| Var216 |
| Var217 |  1.185090e-02|      2|  0.0000000| Var217 |
| Var218 |  1.226579e-02|      2|  0.0000000| Var218 |
| Var219 |  2.900977e-04|      2|  0.0174888| Var219 |
| Var22  |  2.772074e-03|      4|  0.0000000| Var22  |
| Var220 |  4.063878e-03|      2|  0.0000000| Var220 |
| Var221 |  3.967108e-03|      2|  0.0000000| Var221 |
| Var222 |  4.063878e-03|      2|  0.0000000| Var222 |
| Var223 |  2.357560e-04|      2|  0.0361969| Var223 |
| Var224 |  2.279200e-04|      2|  0.0402526| Var224 |
| Var225 |  5.707283e-03|      2|  0.0000000| Var225 |
| Var226 |  2.448209e-03|      2|  0.0000000| Var226 |
| Var227 |  5.561409e-03|      2|  0.0000000| Var227 |
| Var228 |  7.882398e-03|      2|  0.0000000| Var228 |
| Var229 |  7.019455e-03|      2|  0.0000000| Var229 |
| Var23  |  9.813199e-04|      4|  0.0000057| Var23  |
| Var24  |  2.381645e-04|      4|  0.0700741| Var24  |
| Var25  |  2.772074e-03|      4|  0.0000000| Var25  |
| Var26  |  9.813199e-04|      4|  0.0000057| Var26  |
| Var27  |  9.813199e-04|      4|  0.0000057| Var27  |
| Var28  |  2.777872e-03|      4|  0.0000000| Var28  |
| Var29  |  2.992132e-05|      4|  1.0000000| Var29  |
| Var3   |  8.812072e-04|      4|  0.0000195| Var3   |
| Var30  |  2.376463e-05|      4|  1.0000000| Var30  |
| Var33  |  6.334417e-04|      4|  0.0004277| Var33  |
| Var34  |  8.842007e-04|      4|  0.0000188| Var34  |
| Var35  |  2.772074e-03|      4|  0.0000000| Var35  |
| Var36  |  8.842007e-04|      4|  0.0000188| Var36  |
| Var37  |  9.593148e-04|      4|  0.0000074| Var37  |
| Var38  |  2.772074e-03|      4|  0.0000000| Var38  |
| Var4   |  9.593148e-04|      4|  0.0000074| Var4   |
| Var40  |  8.842007e-04|      4|  0.0000188| Var40  |
| Var41  |  2.376463e-05|      4|  1.0000000| Var41  |
| Var43  |  8.842007e-04|      4|  0.0000188| Var43  |
| Var44  |  2.772074e-03|      4|  0.0000000| Var44  |
| Var45  |  6.815674e-05|      4|  0.8151188| Var45  |
| Var46  |  8.842007e-04|      4|  0.0000188| Var46  |
| Var47  |  2.376463e-05|      4|  1.0000000| Var47  |
| Var49  |  8.842007e-04|      4|  0.0000188| Var49  |
| Var5   |  9.813199e-04|      4|  0.0000057| Var5   |
| Var50  |  2.376463e-05|      4|  1.0000000| Var50  |
| Var51  |  6.809351e-04|      4|  0.0002358| Var51  |
| Var53  |  9.100583e-05|      4|  0.5678636| Var53  |
| Var54  |  8.842007e-04|      4|  0.0000188| Var54  |
| Var56  |  1.729184e-04|      4|  0.1717806| Var56  |
| Var57  |  1.529366e-04|      3|  0.1708488| Var57  |
| Var58  |  2.376463e-05|      4|  1.0000000| Var58  |
| Var59  |  2.278508e-04|      4|  0.0805808| Var59  |
| Var6   |  2.674282e-03|      4|  0.0000000| Var6   |
| Var60  |  9.813199e-04|      4|  0.0000057| Var60  |
| Var61  |  6.334417e-04|      4|  0.0004277| Var61  |
| Var62  |  1.707981e-05|      4|  1.0000000| Var62  |
| Var63  |  1.905424e-05|      4|  1.0000000| Var63  |
| Var64  |  7.138463e-05|      4|  0.7735786| Var64  |
| Var65  |  2.974265e-03|      4|  0.0000000| Var65  |
| Var66  |  1.905424e-05|      4|  1.0000000| Var66  |
| Var67  |  9.813199e-04|      4|  0.0000057| Var67  |
| Var68  |  8.842007e-04|      4|  0.0000188| Var68  |
| Var69  |  9.813199e-04|      4|  0.0000057| Var69  |
| Var7   |  9.401229e-03|      4|  0.0000000| Var7   |
| Var70  |  9.813199e-04|      4|  0.0000057| Var70  |
| Var71  |  8.364368e-04|      4|  0.0000340| Var71  |
| Var72  |  2.007878e-03|      4|  0.0000000| Var72  |
| Var73  |  1.852376e-02|      3|  0.0000000| Var73  |
| Var74  |  6.365026e-03|      4|  0.0000000| Var74  |
| Var75  |  8.842007e-04|      4|  0.0000188| Var75  |
| Var76  |  2.772074e-03|      4|  0.0000000| Var76  |
| Var77  |  3.158199e-05|      4|  1.0000000| Var77  |
| Var78  |  2.772074e-03|      4|  0.0000000| Var78  |
| Var80  |  9.813199e-04|      4|  0.0000057| Var80  |
| Var81  |  2.674282e-03|      4|  0.0000000| Var81  |
| Var82  |  9.593148e-04|      4|  0.0000074| Var82  |
| Var83  |  2.772074e-03|      4|  0.0000000| Var83  |
| Var84  |  8.812072e-04|      4|  0.0000195| Var84  |
| Var85  |  2.772074e-03|      4|  0.0000000| Var85  |
| Var86  |  2.376463e-05|      4|  1.0000000| Var86  |
| Var87  |  2.376463e-05|      4|  1.0000000| Var87  |
| Var88  |  5.822901e-04|      4|  0.0008141| Var88  |
| Var89  |  1.729184e-04|      4|  0.1717806| Var89  |
| Var9   |  2.376463e-05|      4|  1.0000000| Var9   |
| Var90  |  2.376463e-05|      4|  1.0000000| Var90  |
| Var91  |  8.364368e-04|      4|  0.0000340| Var91  |
| Var92  |  1.829928e-05|      4|  1.0000000| Var92  |
| Var93  |  9.813199e-04|      4|  0.0000057| Var93  |
| Var94  |  3.706455e-04|      4|  0.0121620| Var94  |
| Var95  |  8.842007e-04|      4|  0.0000188| Var95  |
| Var96  |  8.842007e-04|      4|  0.0000188| Var96  |
| Var97  |  9.813199e-04|      4|  0.0000057| Var97  |
| Var98  |  1.749498e-05|      4|  1.0000000| Var98  |
| Var99  |  9.593148e-04|      4|  0.0000074| Var99  |

``` r
summary(var_values$sig < 1/nrow(var_values))
```

    ##    Mode   FALSE    TRUE 
    ## logical      59     153

``` r
vars <- var_values$var[var_values$sig < 1/nrow(var_values)]


date()
```

    ## [1] "Mon Dec 17 11:22:33 2018"

``` r
date()
```

    ## [1] "Mon Dec 17 11:22:33 2018"

``` r
# Run other models (with proper coding/training separation).
#
# This gets us back to AUC 0.72 range

customCoders = list('c.PiecewiseV.num' = vtreat::solve_piecewise,
                    'n.PiecewiseV.num' = vtreat::solve_piecewise,
                    'c.knearest.num' = vtreat::square_window,
                    'n.knearest.num' = vtreat::square_window)
                   # 'n.poolN.center' = vtreat::ppCoderN, 
                   # 'c.poolC.center' = vtreat::ppCoderC)
                   # 'n.NonDecreasingV.num' = vtreat::solveNonDecreasing,
                   # 'n.NonIncreasingV.num' = vtreat::solveNonIncreasing, 
                   # 'c.NonDecreasingV.num' = vtreat::solveNonDecreasing,
                   # 'c.NonIncreasingV.num' = vtreat::solveNonIncreasing)
cfe = mkCrossFrameCExperiment(dTrain,
                              vars,yName,yTarget,
                              customCoders=customCoders,
                              smFactor=2.0, 
                              parallelCluster=cl)
```

    ## [1] "vtreat 1.3.3 start initial treatment design Mon Dec 17 11:22:33 2018"
    ## [1] " start cross frame work Mon Dec 17 11:24:21 2018"
    ## [1] " vtreat::mkCrossFrameCExperiment done Mon Dec 17 11:25:09 2018"

``` r
treatmentsC = cfe$treatments
scoreFrame = treatmentsC$scoreFrame
selvars <- scoreFrame$varName
treatedTrainM <- cfe$crossFrame[,c(yName,selvars),drop=FALSE]
treatedTrainM[[yName]] = treatedTrainM[[yName]]==yTarget

treatedTest = prepare(treatmentsC,
                      dTest,
                      pruneSig=NULL, 
                      varRestriction = selvars,
                      parallelCluster=cl)
treatedTest[[yName]] = treatedTest[[yName]]==yTarget

# prepare plotting frames
treatedTrainP = treatedTrainM[, yName, drop=FALSE]
treatedTestP = treatedTest[, yName, drop=FALSE]
date()
```

    ## [1] "Mon Dec 17 11:25:10 2018"

``` r
date()
```

    ## [1] "Mon Dec 17 11:25:10 2018"

``` r
mname = 'xgbPred'
print(paste(mname,length(selvars)))
```

    ## [1] "xgbPred 663"

``` r
params <- list(max_depth = 5, 
              objective = "binary:logistic",
              nthread = ncore)
model <- xgb.cv(data = as.matrix(treatedTrainM[, selvars, drop = FALSE]),
                label = treatedTrainM[[yName]],
                nrounds = 400,
                params = params,
                nfold = 5,
                early_stopping_rounds = 10,
                eval_metric = "logloss")
```

    ## [1]  train-logloss:0.503570+0.000287 test-logloss:0.504513+0.000482 
    ## Multiple eval metrics are present. Will use test_logloss for early stopping.
    ## Will train until test_logloss hasn't improved in 10 rounds.
    ## 
    ## [2]  train-logloss:0.400955+0.000461 test-logloss:0.402648+0.001128 
    ## [3]  train-logloss:0.339258+0.000548 test-logloss:0.341947+0.001486 
    ## [4]  train-logloss:0.300467+0.000556 test-logloss:0.303972+0.001908 
    ## [5]  train-logloss:0.275290+0.000557 test-logloss:0.280038+0.002113 
    ## [6]  train-logloss:0.258865+0.000602 test-logloss:0.264881+0.002367 
    ## [7]  train-logloss:0.247651+0.000508 test-logloss:0.254890+0.002347 
    ## [8]  train-logloss:0.239907+0.000685 test-logloss:0.248584+0.002349 
    ## [9]  train-logloss:0.234543+0.000655 test-logloss:0.244387+0.002425 
    ## [10] train-logloss:0.230393+0.000658 test-logloss:0.241935+0.002730 
    ## [11] train-logloss:0.227143+0.000686 test-logloss:0.240089+0.002730 
    ## [12] train-logloss:0.224396+0.000562 test-logloss:0.239014+0.002910 
    ## [13] train-logloss:0.222046+0.000520 test-logloss:0.238253+0.002891 
    ## [14] train-logloss:0.219965+0.000574 test-logloss:0.237751+0.002914 
    ## [15] train-logloss:0.218051+0.000772 test-logloss:0.237379+0.003008 
    ## [16] train-logloss:0.216251+0.000859 test-logloss:0.237136+0.002933 
    ## [17] train-logloss:0.214680+0.000716 test-logloss:0.236931+0.002785 
    ## [18] train-logloss:0.213242+0.000881 test-logloss:0.237123+0.002995 
    ## [19] train-logloss:0.211472+0.000923 test-logloss:0.237112+0.003061 
    ## [20] train-logloss:0.210179+0.001068 test-logloss:0.237074+0.003091 
    ## [21] train-logloss:0.208908+0.000997 test-logloss:0.237097+0.002826 
    ## [22] train-logloss:0.207752+0.001194 test-logloss:0.237323+0.002761 
    ## [23] train-logloss:0.206457+0.001447 test-logloss:0.237230+0.002845 
    ## [24] train-logloss:0.205430+0.001495 test-logloss:0.237183+0.002822 
    ## [25] train-logloss:0.204437+0.001279 test-logloss:0.237295+0.002744 
    ## [26] train-logloss:0.202841+0.001118 test-logloss:0.237367+0.002988 
    ## [27] train-logloss:0.201744+0.001210 test-logloss:0.237407+0.003015 
    ## Stopping. Best iteration:
    ## [17] train-logloss:0.214680+0.000716 test-logloss:0.236931+0.002785

``` r
nrounds <- model$best_iteration
print(paste("nrounds", nrounds))
```

    ## [1] "nrounds 17"

``` r
model <- xgboost(data = as.matrix(treatedTrainM[, selvars, drop = FALSE]),
                 label = treatedTrainM[[yName]],
                 nrounds = nrounds,
                 params = params)
```

    ## [1]  train-error:0.072555 
    ## [2]  train-error:0.072666 
    ## [3]  train-error:0.072599 
    ## [4]  train-error:0.072444 
    ## [5]  train-error:0.072466 
    ## [6]  train-error:0.072577 
    ## [7]  train-error:0.072755 
    ## [8]  train-error:0.072755 
    ## [9]  train-error:0.072555 
    ## [10] train-error:0.072488 
    ## [11] train-error:0.072422 
    ## [12] train-error:0.072422 
    ## [13] train-error:0.072022 
    ## [14] train-error:0.071955 
    ## [15] train-error:0.071667 
    ## [16] train-error:0.071511 
    ## [17] train-error:0.071333

``` r
treatedTrainP[[mname]] = predict(model, 
                                 newdata=as.matrix(treatedTrainM[, selvars, drop = FALSE]), 
                                 type='response')
treatedTestP[[mname]] = predict(model,
                                newdata=as.matrix(treatedTest[, selvars, drop = FALSE]), 
                                n.trees=nTrees)
date()
```

    ## [1] "Mon Dec 17 11:26:37 2018"

``` r
date()
```

    ## [1] "Mon Dec 17 11:26:37 2018"

``` r
t1 = paste(mname,'trainingM data')
print(DoubleDensityPlot(treatedTrainP, mname, yName, 
                        title=t1))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-1.png)

``` r
print(ROCPlot(treatedTrainP, mname, yName, yTarget,
              title=t1))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-2.png)

``` r
print(WVPlots::PRPlot(treatedTrainP, mname, yName, yTarget,
              title=t1))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-3.png)

``` r
t2 = paste(mname,'test data')
print(DoubleDensityPlot(treatedTestP, mname, yName, 
                        title=t2))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-4.png)

``` r
print(ROCPlot(treatedTestP, mname, yName, yTarget,
              title=t2))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-5.png)

``` r
print(WVPlots::PRPlot(treatedTestP, mname, yName, yTarget,
              title=t2))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-6.png)

``` r
print(date())
```

    ## [1] "Mon Dec 17 11:26:40 2018"

``` r
print("*****************************")
```

    ## [1] "*****************************"

``` r
date()
```

    ## [1] "Mon Dec 17 11:26:40 2018"

``` r
if(!is.null(cl)) {
    parallel::stopCluster(cl)
    cl = NULL
}
```
