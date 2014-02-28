# example 10.17 of section 10.4.1 
# (example 10.17 of section 10.4.1)  : Documentation and deployment : Deploying models : Deploying models as R HTTP services 
# Title: Calling the buzz HTTP service 

rowAsForm <- function(url,row) { 	# Note: 1 
   s <- paste('<HTML><HEAD></HEAD><BODY><FORM action="',url,
      '" enctype="multipart/form-data" method="POST">\n',sep='')
   s <- paste(s,'<input type="submit" value="Send"/>',sep='\n')
   qpaste <- function(a,b) {
      paste('<p> ',a,' <input type="text" name="',a,
         '" value="',b,'"/> </p>',sep='') }
   assignments <- mapply('qpaste',varslist,as.list(row)[varslist])
   s <- paste(s,paste(assignments,collapse='\n'),sep='\n')
   s <- paste(s,'</FORM></BODY></HTML>',sep='\n')
   s
}

url <- 'http://127.0.0.1:20714/custom/modelFn' 	# Note: 2 
cat(rowAsForm(url,buzztest[7,]),file='buzztest7.html') 	# Note: 3

# Note 1: 
#   Function to convert a row of dataset into a 
#   huge HTML form that transmits all of the variable 
#   values to HTTP server on submit (when the Send 
#   button is clicked). 

# Note 2: 
#   The URL we started the rook HTTP server on; 
#   you’ll have to copy the URL address and port from 
#   what’s printed when you started the Rook 
#   service. 

# Note 3: 
#   Write the form representing the variables for 
#   the seventh test example to a file. 

