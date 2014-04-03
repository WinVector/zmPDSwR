
# Example code and data for "Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014.


 * The book: ["Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014](http://www.manning.com/zumel/)  (book copyright Manning Publications Co., all rights reserved)
 * The support site: [GitHub WinVector/zmPDSwR](https://github.com/WinVector/zmPDSwR)


## The code and data in this directory supports examples from:
 * Chapter 3: Exploring Data
 * Chapter 4: Managing data

### Derived works (no claim of license here):

<dl>
  <dt>custdata.tsv</dt>
    <dd>Synthetic example data derived from Census PUMS data to demonstrate retail related plots.
</dd>
</dl>    

Load with 
```
custdata <- read.table('custdata.tsv',header=T,sep='\t')
custdata2 <- read.table('custdata2.tsv',header=T,sep='\t')
load('exampleData.rData') # overrides custdata
```


## License for additional documentation, notes, code, and example data: 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

No guarantee, indemnification or claim of fitness is made regarding any of these items.

No claim of license on works of others or derived data.
