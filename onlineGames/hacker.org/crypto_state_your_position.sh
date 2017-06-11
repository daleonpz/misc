#!/bin/bash

# is not SOLVED yet
# Challenge 'State Your Position' [Crypto] 

a="TNAIDDNHBWVEWIAAZECAGINCNMDNJJWIESCCNHDGAGGADTNBNCFCACOKAOKAAKECTHCAHWYGNHDDCKOKAVACWVEWIBMSCDCICAASCHLAANCLDCKNYFNDCMNCWVGMIG"

echo $a |sed -r 's/(.{3})/\1 /g'

# TNA IDD NHB WVE WIA AZE CAG INC NMD NJJ WIE SCC NHD GAG GAD TNB NCF CAC OKA OKA AKE CTH CAH WYG 
# NHD DCK OKA VAC WVE WIB MSC DCI CAA SCH LAA NCL DCK NYF NDC MNC WVG MIG

b="47a 16d 33b 54e 55a 04e 06g 18c 35d 34j 55e 45c 33d 12g 12d 47b 37f 06c 40a 40a 02e 09h 06h 56g 33d 11k 40a 51c 54e 55b 28c 11i 06a 45h 22a 37l 11k 36f 38c 27c 54g 26g "

c="43A 13D 30b 49e 50a 03e 05g 15c 32d 31j 50e 41c 30d 11g 11d 43b 34f 05c 37a 37a 02e 07h 05h 51g 30d 09k 37a 47c 49e 50b 25c 09i 05a 41h 19a 34l 09k 33f 35c 24c 49g 23G "

d="17A 13D 04b 23e 24a 03e 05g 15c 06d 05j 24e 15c 04d 11g 11d 17b 08f 05c 11a 11a 02e 07h 05h 25g 04d 09k 11a 21c 23e 24b 25c 09i 05a 15h 19a 08l 09k 07f 08c 24c 23g 23G "

d="17n 13D 04o 23r 24n 03e 05g 15c 06q 05w 24r 15p 04q 11g 11d 17o 08s 05c 11n 11n 02e 07h 05h 25t 04q 09k 11n 21p 23r 24o 25p 09i 05a 15u 19a 08y 09k 07s 08p 24c 23g 23G "

# e="  e   q   s   o   l   h   l   r   w   b   p   e   u   r   o   "

## the message only uses letters [a-l]
## cipher alphabet = 12
## true alphabet 26
## number of states 51

c="adbeaegcdjecdghbfcaaehhgdkacebciahalkfccgg"
echo $c | sed 's/\(.\)/\1\n/g'  | sort | uniq -c 



