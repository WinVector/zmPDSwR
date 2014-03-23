# example 10.14 of section 10.3.3 
# (example 10.14 of section 10.3.3)  : Documentation and deployment : Using comments and version control for running documentation : Using version control to explore your project 
# Title: Finding line-based differences between two committed versions 

diff --git a/CDC/NatalBirthData.rData b/CDC/NatalBirthData.rData
...
+++ b/CDC/prepBirthWeightData.R
@@ -0,0 +1,83 @@
+data <- read.table("natal2010Sample.tsv.gz",
+                   sep="\t", header=T, stringsAsFactors=F)
+
+# make a boolean from Y/N data
+makevarYN = function(col) {
+  ifelse(col %in% c("", "U"), NA, ifelse(col=="Y", T, F))
+}
...

