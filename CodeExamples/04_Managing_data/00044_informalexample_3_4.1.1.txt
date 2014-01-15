# informalexample:3_4.1.1 
# informalexample:3 : Managing data : Cleaning data : Treating missing values (NAs) 
custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),
                  "not in active workforce",
                   ifelse(custdata$is.employed==T,
                                   "employed",
                                    "not employed"))
