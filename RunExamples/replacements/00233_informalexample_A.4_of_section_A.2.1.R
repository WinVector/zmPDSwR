# informalexample A.4 of section A.2.1 
# (informalexample A.4 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 

# In knitr/Markdown we need to catch the error.

tryCatch(add(1,'fred'),
   error=function(x) print(x))
## Error in a + b : non-numeric argument to binary operator

