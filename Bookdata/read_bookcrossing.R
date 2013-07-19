
# first: replace \" with '
bxUsers <- read.table('BX-Users.csv',header=T,sep=';',comment.char='',stringsAsFactors=F)
# first replace \" with blank
bxBookRatings <- read.table('BX-Book-Ratings.csv',header=T,sep=';',comment.char='',stringsAsFactors=F)
# first: replace \" with '
bxBooks <- read.table('BX-Books.csv',header=T,sep=';',comment.char='',stringsAsFactors=F)
