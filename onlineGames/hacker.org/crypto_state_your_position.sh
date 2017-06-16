#!/bin/bash

# is not SOLVED yet
# Challenge 'State Your Position' [Crypto] 

a="TNAIDDNHBWVEWIAAZECAGINCNMDNJJWIESCCNHDGAGGADTNBNCFCACOKAOKAAKECTHCAHWYGNHDDCKOKAVACWVEWIBMSCDCICAASCHLAANCLDCKNYFNDCMNCWVGMIG"

cc=$(echo $a |sed -r 's/(.{3})/\1\n/g')

dd=$(for i in $cc
do
    echo $i | sed -r 's/(.{2})/\1 /g'
done)

# alpha='"A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L"'
# for i in $alpha
# do
#     echo $dd |sed -r 's/(.{5})/\1\n/g' | awk $2==$i | tr '\n' ' ' && echo 
# done
# 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="A"' | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="B"'  | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="C"' | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="D"' | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="E"' | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="F"' | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="G"' | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="H"' | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="I"' | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="J"' | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="K"' | tr '\n' ' ' && echo 
echo $dd |sed -r 's/(.{5})/\1\n/g' | awk '$2=="L"' | tr '\n' ' ' && echo 


# echo $a |sed -r 's/(.{2}).{1}/\1 /g'
#echo $a |sed -r 's/(.{3})/\1 /g'

# echo $a |sed -r 's/(.{21})/\1\n/g'
# TNA IDD NHB WVE WIA AZE CAG INC NMD NJJ WIE SCC NHD GAG GAD TNB NCF CAC OKA OKA AKE CTH CAH WYG 
# NHD DCK OKA VAC WVE WIB MSC DCI CAA SCH LAA NCL DCK NYF NDC MNC WVG MIG

b="47a 16d 33b 54e 55a 04e 06g 18c 35d 34j 55e 45c 33d 12g 12d 47b 37f 06c 40a 40a 02e 09h 06h 56g 33d 11k 40a 51c 54e 55b 28c 11i 06a 45h 22a 37l 11k 36f 38c 27c 54g 26g "

c="43A 13D 30b 49e 50a 03e 05g 15c 32d 31j 50e 41c 30d 11g 11d 43b 34f 05c 37a 37a 02e 07h 05h 51g 30d 09k 37a 47c 49e 50b 25c 09i 05a 41h 19a 34l 09k 33f 35c 24c 49g 23G "

d="17A 13D 04b 23e 24a 03e 05g 15c 06d 05j 24e 15c 04d 11g 11d 17b 08f 05c 11a 11a 02e 07h 05h 25g 04d 09k 11a 21c 23e 24b 25c 09i 05a 15h 19a 08l 09k 07f 08c 24c 23g 23G "

#  original letters
# vqhcdegsjidthmmvlgoocjgehjozcdcjfthllknbca 
# adbeaegcdjecdgdbfcaaehhgdkacebciahalkfncgg 
# second option
# rnexydfpgfypellrifllchfzejlvxyzjfphijdiyxx
# adbeaegcdjecdgdbfcaaehhgdkacebciahalkfncgg   


d="17n 13D 04o 23r 24n 03e 05g 15c 06q 05w 24r 15p 04q 11g 11d 17o 08s 05c 11n 11n 02e 07h 05h 25t 04q 09k 11n 21p 23r 24o 25p 09i 05a 15u 19a 08y 09k 07s 08p 24c 23g 23G "

## the message only uses letters [a-l]
## cipher alphabet = 12
## true alphabet 26
## number of states 51
## number of elements 42
# AK AZ CA CT DC GA ID IN LA MI MN MS NC ND NH NJ NM NY OK SC TN VA WI WV WY
# 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
#  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y

rot(){
    dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
    phrase=$2 
    rotat=$(echo $1 | sed 's/0//g')
    newphrase=$(echo $phrase | tr "${dual:0:26}" "${dual:${rotat}:26}")
    echo ${newphrase}
}


# "TNA IDD NHB WVE WIA AZE CAG INC NMD NJJ WIE SCC NHD GAG GAD TNB NCF CAC OKA OKA AKE CTH CAH WYG NHD DCK OKA VAC WVE WIB MSC DCI CAA SCH LAA NCL DCK NYF NDC MNC WVG MIG" | 

c="21a 07d 15b 24e 23a 02e 03g 08c 17d 16j 23e 20c 15d 06g 06d 21b 13f 03c 19a 19a 01e 04h 03h 25g 15d 05k 19a 22c 24e 23b 12c 05i 03a 20h 09a 13l 05k 18f 14n 11c 24g 10g"

echo $c |sed -r 's/.{2}(.{1}).{1}/\1/g'

# assuming rotation if n>13
# vdqcxegcuzbesgdwfcttehhfsktycyciajalkxbceg
# basic letters
# adbeaegcdjecdgdbfcaaehhgdkacebciahalkfncgg
# if states were alphabet positions
# ugoxwbchqpwtoffumcssadcyoesvxwlectimernkxj  
# rotate
# vkqcxgjkuzbesmjwsfttflkfsptycyondjjypxbneh

echo "ugoxwbchqpwtoffumcssadcyoesvxwlectimernkxj"  

# adbeaegcdjecdgdbfcaaehhgdkacebciahalkfncgg
# ugoxwbchqpwtoffumcssadcyoesvxwlectimernkxj  

# a b c d e f g h i j  k  l 
# 1 2 3 4 5 6 7 8 9 10 11 12
# dd=$(for i in $c
# do
#    rot ${i:0:2} ${i:2:3}
# done)

# echo $dd | sed 's/ //g'


# need to try as the statse were a unsorted alphabet 


# TH  VbcgRpwtPgGumcRRadcyPkRvxwleBtHmernkxj
# TH  V   R   P G   RR    P R     B H
# ugoxwbchqpwtoffumcssadcyoesvxwlectimernkxj
# adbeaegcdjecdgdbfcaaehhgdkacebciahalkfncgg



    AK AZ CA CT DC GA ID IN LA MI MN MS NC ND NH NJ NM NY OK SC TN VA WI WV WY
A          1                 1                             3     1     1     
B                                              1                 1     1    
C          1              1        1  1     1                 1     1        
D                   1  1                       2     1                       
E    1  1                                                              1  2  
F                                        1              1                    
G          1        1           1                                         1  1 
H          1  1                                               1              
I                1                                                           
J                                                 1                          
K                2                                                           
L                                        1                                   


