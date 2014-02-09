# informalexample:1_10.3.3 
# informalexample:1 : Documentation and deployment : Using comments and version control for running documentation : Using version control to explore your project 
# Title: Using git log to find the last time a file was
                                        around 

$ git log --name-status -- README.txt

commit 2541bb0b9a2173eb1d471e11d4aca3b690a011ef
Author: Marius Butuc <marius.butuc@gmail.com>
Date:   Wed Apr 24 23:52:09 2013 -0400

    Translate readme to Markdown

D       README.txt

commit 9534cff7579607316397cbb40f120d286b7e4b58
Author: John Mount <jmount@win-vector.com>
Date:   Thu Mar 21 17:58:48 2013 -0700

    update licenses

M       README.txt

