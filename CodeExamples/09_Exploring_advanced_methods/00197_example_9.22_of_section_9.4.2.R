# example 9.22 of section 9.4.2 
# (example 9.22 of section 9.4.2)  : Exploring advanced methods : Using SVMs to model complicated decision boundaries : Trying an SVM on artificial example data 
# Title: SVM with a poor choice of kernel 

set.seed(2335246L)
s$group <- sample.int(100,size=dim(s)[[1]],replace=T)
sTrain <- subset(s,group>10)
sTest <- subset(s,group<=10) 	# Note: 1 
mSVMV <- ksvm(class~x+y,data=sTrain,kernel='vanilladot') 	# Note: 2 
sTest$predSVMV <- predict(mSVMV,newdata=sTest,type='response') 	# Note: 3 
ggplot() +
   geom_text(data=sTest,aes(x=x,y=y,
      label=predSVMV),size=12) +
   geom_text(data=s,aes(x=x,y=y,
      label=class,color=class),alpha=0.7) +
   coord_fixed() + 
   theme_bw() + theme(legend.position='none') 	# Note: 4

# Note 1: 
#   Prepare to try to learn spiral class label 
#   from coordinates using a support vector machine. 

# Note 2: 
#   Build the support vector model using a 
#   vanilladot kernel (not a very good kernel). 

# Note 3: 
#   Use the model to predict class on held-out 
#   data. 

# Note 4: 
#   Plot the predictions on top of a grey copy 
#   of all the data so we can see if predictions agree with the original 
#   markings. 

