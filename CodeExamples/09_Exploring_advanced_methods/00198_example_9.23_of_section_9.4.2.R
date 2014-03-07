# example 9.23 of section 9.4.2 
# (example 9.23 of section 9.4.2)  : Exploring advanced methods : Using SVMs to model complicated decision boundaries : Trying an SVM on artificial example data 
# Title: SVM with a good choice of kernel 

mSVMG <- ksvm(class~x+y,data=sTrain,kernel='rbfdot') 	# Note: 1 
sTest$predSVMG <- predict(mSVMG,newdata=sTest,type='response')
ggplot() +
   geom_text(data=sTest,aes(x=x,y=y,
      label=predSVMG),size=12) +
   geom_text(data=s,aes(x=x,y=y,
      label=class,color=class),alpha=0.7) +
   coord_fixed() + 
   theme_bw() + theme(legend.position='none')

# Note 1: 
#   This time use the "radial" or 
#   Gaussian kernel, which is a nice geometric similarity measure. 

