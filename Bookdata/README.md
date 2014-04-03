
# Example code and data for "Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014.


 * The book: ["Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014](http://www.manning.com/zumel/) (book copyright Manning Publications Co., all rights reserved)
 * The support site: [GitHub WinVector/zmPDSwR](https://github.com/WinVector/zmPDSwR)


## The code and data in this directory supports examples from:
 * Chapter 8: Using Unsupervised Methods


## Original data: 
Book-Crossing dataset mined by Cai-Nicolas Ziegler, DBIS Freiburg
original link http://www.informatik.uni-freiburg.de/~cziegler/BX/

Collected by Cai-Nicolas Ziegler in a 4-week crawl (August / September
2004) from the Book-Crossing community with kind permission from Ron
Hornbaker, CTO of Humankind Systems. Contains 278,858 users
(anonymized but with demographic information) providing 1,149,780
ratings (explicit / implicit) about 271,379 books.

Freely available for research use when acknowledged with the
following reference (further details on the dataset are given in this
publication): 

Improving Recommendation Lists Through Topic
Diversification, Cai-Nicolas Ziegler, Sean M. McNee, Joseph
A. Konstan, Georg Lausen; Proceedings of the 14th International World
Wide Web Conference (WWW '05), May 10-14, 2005, Chiba, Japan. To
appear.

http://www.informatik.uni-freiburg.de/~cziegler/BX/WWW-2005-Preprint.pdf


## Derived works (no claim of license on these):

 * bxBooks.RData     : R-binary version of Book-Crossing dataset.
 * bookdata.tsv.gz   : gzipped tab-separated file containing customer book ratings by title and numerical rating

## Our additional documentation, notes, code, and example data: 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

 * read_bookcrossing.R   : script to read in original data files and create bxBooks.RData
 * create_bookdata.R     : script to create the data file bookdata.tsv



