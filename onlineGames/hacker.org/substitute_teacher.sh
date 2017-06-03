#!/bin/bash

# Challenge 'Substitute Teacher' [Crypto]

a="ISS NVVK DIPXYWA PIT AVSUY QIAOP PWZEHVNWIEDZ. CDYT ZVM LOTK HDY AVSMHOVT HV HDOA HYFH, ZVM COSS QY IQSY HV NYH HDY ITACYW, CDOPD OA IKMGQWIHY"

# find the word that correspond to ANSWER
echo $a |  sed 's/[,.\r]//g' | tr ' ' '\n' | sort  | uniq -c | awk '{ print $1 "\t"  length($2) "\t" $2}' | awk '$2==6'

# then I used THE and IS to find the basic matches and the I iterate
# 
echo $a | sed 's/I/a/g;s/T/n/g;s/A/s/g;s/C/w/g;s/Y/e/g;s/W/r/g;s/H/t/g;s/D/h/g;s/O/i/g;s/P/c/g;s/Q/b/g;s/X/k/g;s/S/l/g;s/V/o/g;s/U/v/g;s/N/g/g;s/K/d/g;s/Z/y/g;s/E/p/g;s/M/u/g;s/F/s/g;s/L/f/g'

## this line is to find which letter is missing , 
## I had to find the match for G, possible choices (j,m)

echo "/I/a/g;s/T/n/g;s/A/s/g;s/C/w/g;s/Y/e/g;s/W/r/g;s/H/t/g;s/D/h/g;s/O/i/g;s/P/c/g;s/Q/b/g;s/X/k/g;s/S/l/g;s/V/o/g;s/U/v/g;s/N/g/g;s/K/d/g;s/Z/y/g;s/E/p/g;s/M/u/g;s/F/s/g;s/L/f/g"  | sed "s/g;s/\n/g;s/\// /g" | awk '{print $2 "\t"  $1}' | sort


# ITACYW  
# ANSWER

# HDY
# THE

# OA
# IS 

# NVVK
# LOOP
# 
# NYH
# LET

