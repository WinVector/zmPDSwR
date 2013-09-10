data <- read.table("natal2010Sample.tsv.gz",
                   sep="\t", header=T, stringsAsFactors=F)

# make a boolean from Y/N data
makevarYN = function(col) {
  ifelse(col %in% c("", "U"), NA, ifelse(col=="Y", T, F))
}

# make a numeric var w/NAs from numeric data
makevarNum = function(col, sentinel) {
  ifelse(col==sentinel, NA, col)
}

# make a boolean from 1/2/9 data.
makevar12 = function(col) {
  ifelse(col==9, NA, ifelse(col==1, T, F))
}

# tobacco use: CIG_REC (Y, N, U, Blank)
data$CIG_REC = makevarYN(data$CIG_REC)

# maternal delivery weight, maternal prepregnancy weight (pounds)
# capped at 400lbs
data$PWGT = makevarNum(data$PWGT, 999)
# babies birth weight
data$DWGT = makevarNum(data$PWGT, 999)
# weight gain during pregnancy
data$WTGAIN = makevarNum(data$WTGAIN, 99)
# birth weight in grams
data$DBWT = makevarNum(data$DBWT, 9999)
# mother's age
data$MAGER = makevarNum(data$MAGER, 99) # 

# number of prenatal visits
data$UPREVIS = makevarNum(data$UPREVIS, 99)

# We don't use these in the chapter, but I'll leave them
# in, anyway

#risk factors (1,2,9,Blank)
# diabetes, chronic hypertension, pregnancy-associated hypertension
# eclampsia
riskfactors = c("URF_DIAB", "URF_CHYPER", "URF_PHYPER", 
                "URF_ECLAM")
data[, riskfactors] = as.data.frame(lapply(data[, riskfactors], FUN=makevar12))

# reset the "default" level on categorical variabls
recode = function(col, map, ref) {
  relevel(as.factor(map[col]), ref=ref)
}

# gestation length
# GESTREC3 (1,2,3 -- <37weeks(premie), >=37wks, NA)
grmap = c("< 37 weeks",
          ">= 37 weeks",
          NA)
data$GESTREC3 = recode(data$GESTREC3, grmap, grmap[[2]])

# DPLURAL : birth plurality
plmap = c("single",
          "twin",
          "triplet or higher",
          "triplet or higher",
          "triplet or higher")
data$DPLURAL = recode(data$DPLURAL, plmap, "single")

x = c("PWGT", 
      "WTGAIN",
      "MAGER",
      "UPREVIS", 
      "CIG_REC",
      "GESTREC3",
      "DPLURAL",
      riskfactors)

sdata = data[, c(x, c("DBWT", "ORIGRANDGROUP"))]

# get rid of the NA data before splitting into train and test
# noNAs is T if there are no NAs in the row
noNAs = rowSums(as.data.frame(lapply(sdata, FUN=is.na))) == 0
sdata = sdata[noNAs, ]

save(sdata, file="NatalBirthData.rData")
