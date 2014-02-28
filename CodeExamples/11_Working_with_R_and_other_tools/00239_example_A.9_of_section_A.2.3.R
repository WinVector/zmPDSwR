# example A.9 of section A.2.3 
# (example A.9 of section A.2.3)  : Working with R and other tools : Starting with R : Loading data from HTTPS sources 
# Title: Loading UCI car data directly from GitHub using HTTPS 

require(RCurl) 	# Note: 1 
urlBase <- 
  'https://raw.github.com/WinVector/zmPDSwR/master/' 	# Note: 2 
mkCon <- function(nm) { 	# Note: 3 
   textConnection(getURL(paste(urlBase,nm,sep='')))
}
cars <- read.table(mkCon('UCICar/car.data.csv'), 	# Note: 4 
    sep=',',header=T,comment.char='')

# Note 1: 
#   Bring in the RCurl library for more connection 
#   methods. 

# Note 2: 
#   Form a valid HTTPS base URL for raw access to 
#   the GitHub repository. 

# Note 3: 
#   Define a function that wraps a URL path 
#   fragment into a usable HTTPS connection. 

# Note 4: 
#   Load the car data from GitHub over 
#   HTTPS. 

