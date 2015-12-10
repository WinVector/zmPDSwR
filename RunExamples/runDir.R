
runDir <- function(sourcedir,datadir,first=0,last=1000000000) {
  origCurDir <- getwd()
  setwd(datadir)
  for(sfile in sort(list.files(sourcedir,
                               pattern='.*.R'))) {
    exampleNumber <- as.integer(gsub('_.*$','',sfile))
    if((exampleNumber>=first)&&(exampleNumber<=last)) {
      spath <- paste(sourcedir,sfile,sep='/')
      print(paste('############################### start ',
                  exampleNumber,
                  date()))
      print(paste("#####  running ",spath))
      print(paste("#####   in directory",datadir))
      source(spath,
             echo=TRUE,print.eval=TRUE,keep.source=TRUE,
             prompt.echo='> ',continue.echo=' ',
             max.deparse.length=1000000000)
      print(paste('############################### end ',
                  exampleNumber,
                  date()))
    }
  }
  setwd(origCurDir)
}
