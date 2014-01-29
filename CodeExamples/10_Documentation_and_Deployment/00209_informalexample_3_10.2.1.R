# informalexample:3_10.2.1 
# informalexample:3 : Documentation and deployment : Using knitr to produce milestone documentation : What is knitr? 
echo "library(knitr); knit('add.Rnw')" | R --vanilla 	# Note: 1 
pdflatex add.tex 	# Note: 2 

# Note 1: 
#   Use R in batch mode 
#   to create add.tex from add.Rnw 

# Note 2: 
#   Use LaTeX to crate 
#   add.pdf from add.tex 
