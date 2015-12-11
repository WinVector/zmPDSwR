One of the big points of [Practical Data Science with
R](http://www.practicaldatascience.com) is to supply a large number of
fully worked examples. Our intent has always been for readers to read
the book, and if they wanted to follow up on a data set or technique to
find the matching worked examples in the project directory of our [book
support materials git repository](https://github.com/WinVector/zmPDSwR).

Some readers want to work much closer to the sequence in the book. To
make working along with book easier we extracted all book examples and
shared them with our readers (in a [Github
directory](https://github.com/WinVector/zmPDSwR/tree/master/CodeExamples),
and a [downloadable zip
file](https://github.com/WinVector/zmPDSwR/blob/master/CodeExamples.zip),
press "Raw" to download). The direct extraction from the book guarantees
the files are in sync with our revised book. However there are
trade-offs, sometimes (for legibility) the book mixed input and output
without using R's comment conventions. So you can't always just paste
everything. Also for a snippet to run you may need some libraries, data
and results of previous snippets to be present in your R environment.

To help these readers we have added a new section to the book support
materials: [knitr markdown sheets that work all the book extracts from
each
chapter](https://github.com/WinVector/zmPDSwR/tree/master/RunExamples).
Each chapter and appendix now has a matching markdown file that sets up
the correct context to run each and every snippet extracted from the
book. In principle you can now clone the entire zmPDSwR repository to
your local machine and run all the from the CodeExamples directory by
using the RStudio project in RunExamples. Correct execution also depens
on having the right packages installed so we have also added a worksheet
showing everything we expect to see installed in one place:
[InstallAll.Rmd](https://github.com/WinVector/zmPDSwR/blob/master/RunExamples/InstallAll.Rmd)
(note some of the packages require external dependencies to work such as
a C compiler, curl libraries, and a Java framework to run).
