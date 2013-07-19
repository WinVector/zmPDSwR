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