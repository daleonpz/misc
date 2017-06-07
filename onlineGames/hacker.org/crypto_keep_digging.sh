#!/bin/bash

# Challenge 'Keep Digging' [Crypto]

a="ab cd eafgd cd chfe ijd afbcdk hb caiblf"
# counting letters
echo $a | sed 's/\(.\)/\1\n/g'  | sort | uniq -c | sort

# the flags is a break sentence, nothing else
# Awithflag is the same as A
# looking for a word to answer 
echo  $a  |  sed 's/[,.\r]//g' | tr ' ' '\n' | sort  | uniq -c | awk '{ print $1 "\t"  length($2) "\t" $2}' | awk '$2==6'

echo $a | tr 'afbcdk h ij l' 'ANSWER I TH O'



