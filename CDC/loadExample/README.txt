
4-25-2013
John Mount
Data from http://www.cdc.gov/nchs/data_access/Vitalstatsonline.htm
  page saved as: orig/Data Access - Vital Statistics Online.html
  extract orig/ftp targets as ftp.txt 
  download (in orig dir):  wget -nd -i ftp.txt
  shasum *.pdf *.zip > shasums.txt


file processing (subdir of orig called tmp):
 get at field defs
  pdftohtml -xml ../UserGuide2010.pdf -stdout > UserGuide2010.xml
 result file is not valid XML (some mis-matched open/close tags)
 field defs are in lines 6327 through 18953 (<page> boundaries)
  cut down to field def range:
  replace string '\</span[^<]>' with ''
  replace regexp '\<span[^<]*\>' with ''
  replace string '<">' with ''
 field targets are: "Position" "Len" "Field" "Description" "Flag Position" "Rev*" "Values Definition"
 ingores: anything with top lower than position, and footnotes (anything after "*U,R" text on page)
 get at data
  unzip ../Nat2010us.zip
  gzip -9 VS2010NATL.DETAILUS.DAT 
 working in stdworkspace on CDCDef project and LoadFFF on SQLScrewdriver
