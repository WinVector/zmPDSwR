
# plumber.R
# package: https://CRAN.R-project.org/package=plumber 
# this example: https://github.com/WinVector/PDSwR2/tree/master/Buzz


load('thRS500.Rdata')
library(randomForest)
numericPositions <- sapply(buzztrain[, varslist], is.numeric)

#* Show a column of the i-th row of the data sample.
#* @param i the row index
#* @param col the column name
#* @post /show_row_i_col
function(i, col) { 	
  buzztrain[i, col, drop = TRUE]
}

#* Score the i-th row of the data sample.
#* @param i the row index
#* @post /score_row_i
function(i) { 	
  dat <- buzztrain[i, ]
  predict(fmodel, newdata = dat, type = "prob")
}

#* Score the i-th row of the data sample.
#* @param i the row index
#* @param col the column name
#* @param newval the new value for the column col
#* @post /score_row_i_modified
function(i, col, newval) { 	
  dat <- buzztrain[i, ]
  dat[1, col] <- newval
  predict(fmodel, newdata = dat, type = "prob")
}

# # Variable importances:
# head(imp[order(-imp$MeanDecreaseAccuracy), , drop = FALSE])
## 0        1 MeanDecreaseAccuracy MeanDecreaseGini
## num.displays_07 13.97224 20.54069             21.44778         250.4222

# To use the server:
#  try RCurl_client_example.Rmd
#
#
# # Or in a bash shell:
# curl --data '{"i":1}' http://localhost:8000/score_row_i
## [[0.99,0.01]]
# curl --data '{"i":1, "col":"num.displays_01"}' http://localhost:8000/show_row_i_col
## [1108]
# curl --data '{"i":1, "col":"num.displays_01", "newval":0}' http://localhost:8000/score_row_i_modified
## [[0.968,0.032]]


