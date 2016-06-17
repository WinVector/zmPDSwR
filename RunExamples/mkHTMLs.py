#! /usr/local/bin/python3

import os
import subprocess

flist = [f for f in os.listdir('.') if f.endswith('.md') ]
for fi in flist:
    fh = ''.join([fi[:-3],'.html'])
    subprocess.call(['pandoc',fi,'-o',fh])

