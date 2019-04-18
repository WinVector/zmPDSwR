RCurl client example
================

In another R run the following:

    library("plumber")
    r <- plumb("plumber.R")
    r$run(port=8000)

Then that server can service queries such as the following:

``` r
library("RCurl")
```

    ## Warning: package 'RCurl' was built under R version 3.5.2

    ## Loading required package: bitops

``` r
library("jsonlite")

post_query <- function(method, args) {
  hdr <- c("Content-Type" = "application/x-www-form-urlencoded")
  resp <- postForm(
    paste0("http://localhost:8000/", method),
    .opts=list(httpheader = hdr, 
               postfields = toJSON(args)))
  fromJSON(resp)
}

post_query("score_row_i", 
           list(i = 1))
```

    ##      [,1] [,2]
    ## [1,] 0.99 0.01

``` r
post_query("show_row_i_col", 
           list(i = 1, col = "num.displays_01"))
```

    ## [1] 1108

``` r
post_query("score_row_i_modified", 
           list(i = 1, col = "num.displays_01", newval = 0))
```

    ##       [,1]  [,2]
    ## [1,] 0.968 0.032
