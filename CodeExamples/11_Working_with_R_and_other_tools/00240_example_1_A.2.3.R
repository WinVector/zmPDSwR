# example:1_A.2.3 
# example:1 : Working with R and other tools : Starting with R : Loading data from https sources 
# Title: 
                                Loading UCI car data directly from GitHub using https 


                                Loading UCI car data directly from GitHub using https
require(RCurl) 	# Note: 1 
urlBase <- 
  'https://raw.github.com/WinVector/zmPDSwR/master/' 	# Note: 2 
mkCon <- function(nm) { 	# Note: 3 
   textConnection(getURL(paste(urlBase,nm,sep='')))
}
cars <- read.table(mkCon('UCICar/car.data.csv'), 	# Note: 4 
    sep=',',header=T,comment.char='')
print(summary(cars))
##    buying      maint       doors     persons     lug_boot    safety      rating    
##  high :432   high :432   2    :432   2   :576   big  :576   high:576   acc  : 384  
##  low  :432   low  :432   3    :432   4   :576   med  :576   low :576   good :  69  
##  med  :432   med  :432   4    :432   more:576   small:576   med :576   unacc:1210  
##  vhigh:432   vhigh:432   5more:432                                     vgood:  65

# Note 1: 
#   Bring in the RCurl library for more connection methods 

# Note 2: 
#   Form a valid https base URL for raw access to the GitHub repository 

# Note 3: 
#   Define a function that wraps a URL path fragment into a usable https connection 

# Note 4: 
#   Load the car data from GitHub over https 

