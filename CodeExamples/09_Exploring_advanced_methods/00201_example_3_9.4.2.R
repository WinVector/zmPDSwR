# example:3_9.4.2 
# example:3 : Exploring advanced methods : Using support vector machines to model complicated decision
            boundaries : Trying an SVM on artificial example data 
mSVMG <- ksvm(class~x+y,data=sTrain,kernel='rbfdot')
sTest$predSVMG <- predict(mSVMG,newdata=sTest,type='response')
ggplot() +
   geom_point(data=sTest,aes(x=x,y=y,shape=predSVMG=='1'),
     show_guide=T) +
   geom_point(data=s,aes(x=x,y=y,shape=class=='1'),alpha=0.2,
     show_guide=F) +
   coord_fixed()
