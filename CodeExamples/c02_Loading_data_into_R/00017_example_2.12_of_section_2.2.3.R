# example 2.12 of section 2.2.3 
# (example 2.12 of section 2.2.3)  : Loading data into R : Working with relational databases : Working with the PUMS data 
# Title: Selecting a subset of the Census data 

psub = subset(dpus,with(dpus,(PINCP>1000)&(ESR==1)&
   (PINCP<=250000)&(PERNP>1000)&(PERNP<=250000)&
   (WKHP>=40)&(AGEP>=20)&(AGEP<=50)&
   (PWGTP1>0)&(COW %in% (1:7))&(SCHL %in% (1:24)))) 	# Note: 1

# Note 1: 
#   Subset of data rows matching detailed 
#   employment conditions 

