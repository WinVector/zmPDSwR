

# Example code and data for "Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014.


 * The book: ["Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014](http://www.manning.com/zumel/) (book copyright Manning Publications Co., all rights reserved)
 * The support site: [GitHub WinVector/zmPDSwR](https://github.com/WinVector/zmPDSwR)


## The code and data in this directory supports examples from:
 * Chapter 8: Using Unsupervised Methods


Original data source: http://lib.stat.cmu.edu/DASL/Datafiles/Protein.html
Authorization: Free Use

Derived data source
protein.txt     : direct copy of original data

Load data:
protein <- read.table('protein.txt', header=T, sep='\t')

Reference: Weber, A. (1973) Agrarpolitik im Spannungsfeld der internationalen Ernaehrungspolitik, Institut fuer Agrarpolitik und marktlehre, Kiel. 
Data also found in: Gabriel, K.R. (1981) Biplot display of multivariate matrices for inspection of data and diagnosis. 
In Interpreting Multivariate Data (Ed. V. Barnett), New York: John Wiley & Sons, 147-173. Hand, D.J., et al. (1994) A Handbook of Small Data Sets, London: Chapman & Hall, 297-298.

Description: These data measure protein consumption in twenty-five European countries for nine food groups. It is possible to use multivariate methods to determine whether there are groupings of countries and whether meat consumption is related to that of other foods.

Number of cases: 25
Variable Names:
Country: Country name
RdMeat: Red meat
WhMeat: White meat
Eggs: Eggs
Milk: Milk
Fish: Fish
Cereal: Cereals
Starch: Starchy foods
Nuts: Pulses, nuts, and oil-seeds
Fr&Veg: Fruits and vegetables


## License for additional documentation, notes, code, and example data: 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

No guarantee, indemnification or claim of fitness is made regarding any of these items.

No claim of license on works of others or derived data.
