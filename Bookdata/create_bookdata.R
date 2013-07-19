load("bxBooks.RData")
colnames(bxBooks) <- gsub(".", "_", colnames(bxBooks), fixed=T)
colnames(bxBookRatings) <- gsub(".", "_", colnames(bxBookRatings), fixed=T)
colnames(bxUsers) <- gsub(".", "_", colnames(bxUsers), fixed=T)

Sys.setlocale('LC_ALL','C') # to deal with the non-US characters
# remove parentheticals, which are usually
# at the end of the title. First get rid of the open paren
booktokens <- gsub("(", "#", bxBooks$Book_Title, fixed=T)
booktokens <- gsub("^#", "(", booktokens)
booktokens <- gsub("#.*$", "", booktokens) # leaves a trailing white space
cleantitles <- sub("[[:space:]]+$","",booktokens) # save these

booktokens <- tolower(cleantitles)
Books <- data.frame(ISBN=bxBooks$ISBN, token=booktokens, title=cleantitles)

library(sqldf)
# picks a unique isbn for every token  -- this is the number of unique tokens
bookmap <- sqldf('SELECT min(ISBN) as misbn,
                        token 
                 FROM Books
                 GROUP BY token')

# displaymap has a title for every unique token
displaymap <- sqldf('SELECT Books.title as title,
                           bookmap.token as token
                   FROM Books,
                        bookmap
                   WHERE Books.ISBN=bookmap.misbn')

# bookdata1 is shorter than bxBookRatings because
# some of the rated books are not in the bxBooks data
bookdata1 <- sqldf('SELECT ratings.User_ID as userid,
                         Books.token as token,
                         ratings.Book_Rating as rating
                  FROM Books,
                       bxBookRatings as ratings
                  WHERE ratings.ISBN=Books.ISBN')

# add the displayname
bookdata <- merge(bookdata1, displaymap, by="token")

write.table(bookdata, file="bookdata.tsv",
            sep="\t", row.names=F, col.names=T)