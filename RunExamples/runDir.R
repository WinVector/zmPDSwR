
#' Run examples from Practical Data Science in R in a given data directory.
#' 
#' runDir changes directory to datadir, runs the R examples number between
#' first and last (inclusive) found in sourcedir.
#' @parm sourcedir character path to take R examples from PATH RELATIVE to datadir
#' @param datadir character path to run in (and take data from)
#' @param first integer optional first numbered example eligible to run
#' @param last integer optional last numbered example eligible to run
runDir <- function(sourcedir,datadir,first=0,last=1000000000) {
  origCurDir <- getwd()
  setwd(datadir)
  for(sfile in sort(list.files(sourcedir,
                               pattern='.*.R$'))) {
    exampleNumber <- as.integer(gsub('_.*$','',sfile))
    if((exampleNumber>=first)&&(exampleNumber<=last)) {
      replaceSource <- paste(origCurDir,'replacements',sfile,sep='/')
      if(file.exists(replaceSource)) {
        spath <- replaceSource
      } else {
        spath <- paste(sourcedir,sfile,sep='/')
      }
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
