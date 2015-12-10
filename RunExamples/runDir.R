
runDir <- function(sourcedir,datadir) {
  origCurDir <- getwd()
  setwd(datadir)
  for(sfile in sort(list.files(sourcedir))) {
    spath <- paste(sourcedir,sfile,sep='/')
    print('###############################')
    print(paste("#####  running ",spath))
    print(paste("#####   in directory",datadir))
    source(spath,
           echo=TRUE,print.eval=TRUE,keep.source=TRUE,
           prompt.echo='> ',continue.echo=' ',
           max.deparse.length=1000000000)
    print('###############################')
  }
  setwd(origCurDir)
}