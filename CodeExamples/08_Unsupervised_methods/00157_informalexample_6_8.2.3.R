# informalexample:6_8.2.3 
# informalexample:6 : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: A density plot of basket sizes 

> bookCount <- (bookFreq/sum(bookFreq))*sum(basketSizes)     	# Note: 1 
> summary(bookCount)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
   1.000    1.000    1.000    4.637    3.000 2502.000
> orderedBooks <- sort(bookCount, decreasing=T)   	# Note: 2 
> orderedBooks[1:10]
                                    Wild Animus
                                           2502
                      The Lovely Bones: A Novel
                                           1295
                              She's Come Undone
                                            934
                              The Da Vinci Code
                                            905
          Harry Potter and the Sorcerer's Stone
                                            832
                     The Nanny Diaries: A Novel
                                            821
                                A Painted House
                                            819
                          Bridget Jones's Diary
                                            772
                        The Secret Life of Bees
                                            762
Divine Secrets of the Ya-Ya Sisterhood: A Novel
                                            737
> orderedBooks[1]/dim(bookbaskets)[1]                 	# Note: 3 
Wild Animus
 0.02716376

# Note 1: 
#   Get the absolute 
#   count of book occurrences 

# Note 2: 
#   Sort the count and 
#   list the ten most popular books 

# Note 3: 
#   The most popular book 
#   in the data set occurred in fewer than 3% of the 
#   baskets 

