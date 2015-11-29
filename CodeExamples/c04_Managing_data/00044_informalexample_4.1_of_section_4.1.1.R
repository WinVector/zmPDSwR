# informalexample 4.1 of section 4.1.1 
# (informalexample 4.1 of section 4.1.1)  : Managing data : Cleaning data : Treating missing values (NAs) 

custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),
                  "not in active workforce",
                   ifelse(custdata$is.employed==T,
                                   "employed",
                                    "not employed"))

