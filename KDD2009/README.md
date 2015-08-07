

# Example code and data for "Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014.


 * The book: ["Practical Data Science with R" by Nina Zumel and John Mount, Manning 2014](http://www.manning.com/zumel/)
 * The support site: [GitHub WinVector/zmPDSwR](https://github.com/WinVector/zmPDSwR)


## The code and data in this directory supports examples from:
 * Chapter 5: Choosing and Evaluating Models
 * Chapter 6: Using Memorization Methods


A workspace containing most of the results has been saved as KDD2009.Rdata and can be loaded in R with the command:
```R
load('KDD2009.Rdata')
```
(note you will have to re-load various libraries like ROCR to perform some of the steps).


6-2-2013
Data from: http://www.sigkdd.org/kdd-cup-2009-customer-relationship-prediction
Downloaded:
$ shasum *
	e43a38e3477e38b354943519954b719ec7623c2f  orange_small_train.data.zip
	8274d23235630717659898900b7f74092ff339ad  orange_small_train_appetency.labels.txt
	ec2de79844657fb892ec9047e6304c12b296ff68  orange_small_train_churn.labels.txt
	4cd2d7c9b20fd3638883a91a2fed6a03a4d5d015  orange_small_train_upselling.labels.txt
Data to support examples in the chapter on memorization methods in "Practical Data Science with R" ( http://www.manning.com/zumel/ ).

Load data:
```bash
  unzip orange_small_train.data.zip
  gzip -9 orange_small_train.data
```

See [KDDmodels.Rmd](KDDmodels.Rmd) for examples and details and [KDD2009vtreat.Rmd](KDD2009vtreat.Rmd) for a newer [vtreat](http://www.win-vector.com/blog/2014/08/vtreat-designing-a-package-for-variable-treatment/) based demonstration.
