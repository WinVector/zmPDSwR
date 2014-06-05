

# Example code and data for "Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014.


 * The book: ["Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014](http://www.manning.com/zumel/)  (book copyright Manning Publications Co., all rights reserved)
 * The support site: [GitHub WinVector/zmPDSwR](https://github.com/WinVector/zmPDSwR)


## The code and data in this directory supports examples from:
 * Chapter 7: Using Linear and Logistic Regression
 * Chapter 9: Exploring Advanced Methods
 * Chapter 10: Documentation and Deployment


### Data


Data originally downloaded 4-25-2013 from [http://www.cdc.gov/nchs/data_access/Vitalstatsonline.htm](http://www.cdc.gov/nchs/data_access/Vitalstatsonline.htm)

 * [ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Dataset_Documentation/DVS/natality/UserGuide2010.pdf](ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Dataset_Documentation/DVS/natality/UserGuide2010.pdf)
 * Shasum: 12520b8384defc63a93fad957936fd7ee9a42ef3  UserGuide2010.pdf
 * [ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/DVS/natality/Nat2010us.zip](ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/DVS/natality/Nat2010us.zip)
 * Shasum: dad8b9fc9e8b4a4d250b7febf10d4b97350e2651  Nat2010us.zip

Files:

 * README.html : this docuemnt
 * README.md : this docuemnt
 * UserGuide2010.pdf : original CDC user guide
 * NatalBirthData.rData : prepared saved data in R format (produced by prepBirthWeightData.R)
 * NatalRiskData.rData : prepared saved data in R format (produced by PrepNatalRiskData.R)
 * prepBirthWeightData.R : R steps to prepare birth weight data from natal2010Sample.tsv.gz
 * PrepNatalRiskData.R : R steps to prepare natality risk data from natal2010Sample.tsv.gz
 * gamSplinePlots.R : some plotting examples
 * natal2010Sample.tsv.gz : a uniform sample of the Natality risk data in gzipped TSV format (produced by procedures in loadExample directory)
 * loadExample : detailed procedures used to prepare the data


## License for our additional documentation, notes, code, and example data: 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

No guarantee, indemnification or claim of fitness is made regarding any of these items.

No claim of license on works of others or derived data.
