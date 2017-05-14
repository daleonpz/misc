#!/bin/bash

# Challenge 'Go Forth' [Web]
file fl.bin
gzip -cd fl.bin

# Challenge 'Lorem Ipsum' [Web]
# sed: strips punctuation  and \r, I found that bastard with vim
# tr: change ' ' to '\n'
# awk is to get the row in which the first column == 1
cat lorem.txt | sed 's/[,.\r]//g' | tr ' ' '\n'  | sort | uniq -c | awk '$1==1'
