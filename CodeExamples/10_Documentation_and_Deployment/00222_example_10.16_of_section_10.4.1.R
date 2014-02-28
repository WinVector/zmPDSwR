# example 10.16 of section 10.4.1 
# (example 10.16 of section 10.4.1)  : Documentation and deployment : Deploying models : Deploying models as R HTTP services 
# Title: Buzz model as an R-based HTTP service 

library(Rook)  	# Note: 1 
load('thRS500.Rdata') 	# Note: 2 
library(randomForest) 	# Note: 3 
numericPositions <- sapply(buzztrain[,varslist],is.numeric) 	# Note: 4 

modelFn <- function(env) { 	# Note: 5 
   errors <- c()
   warnings <- c()
   val <- c()
   row <- c()
   tryCatch(
      {
         arg <- Multipart$parse(env) 	# Note: 6 
         row <- as.list(arg[varslist])
         names(row) <- varslist
         row[numericPositions] <- as.numeric(row[numericPositions])
         frame <- data.frame(row)
         val <- predict(fmodel,newdata=frame)
      },
      warning = function(w) { message(w)
         warnings <<- c(warnings,as.character(w)) },
      error = function(e) { message(e)
         errors <<- c(errors,as.character(e)) }
   )
   body <- paste( 	# Note: 7 
      'val=',val,'\n',
      'nerrors=',length(errors),'\n',
      'nwarnings=',length(warnings),'\n',
      'query=',env$QUERY_STRING,'\n',
      'errors=',paste(errors,collapse=' '),'\n',
      'warnings=',paste(warnings,collapse=' '),'\n',
      'data row','\n',
      paste(capture.output(print(row)),collapse='\n'),'\n',
      sep='')
   list(
      status=ifelse(length(errors)<=0,200L,400L),
      headers=list('Content-Type' = 'text/text'),
      body=body )
}


s <- Rhttpd$new() 	# Note: 8 
s$add(name="modelFn",app=modelFn) 	# Note: 9 
s$start() 	# Note: 10 
print(s)
## Server started on 127.0.0.1:20714
## [1] modelFn http://127.0.0.1:20714/custom/modelFn 	# Note: 11 
## 
## Call browse() with an index number or name to run an application.

# Note 1: 
#   Load the rook HTTP server library. 

# Note 2: 
#   Load the saved buzz workspace (includes the 
#   random forest model). 

# Note 3: 
#   Load the random forest library (loading the 
#   workspace doesn’t load the library). 

# Note 4: 
#   Determine which variables are numeric (in the 
#   rook server, everything defaults to 
#   character). 

# Note 5: 
#   Declare the modeling service. 

# Note 6: 
#   This block does the actual work: parse data 
#   and apply the model. 

# Note 7: 
#   Format results, place in a list, and 
#   return. 

# Note 8: 
#   Start a new rook HTTP service. 

# Note 9: 
#   Register our model function as an HTTP 
#   service. 

# Note 10: 
#   Start the HTTP server. 

# Note 11: 
#   This is the URL where the service is 
#   running. 

