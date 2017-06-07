#!/bin/bash

# Challenge 'How is your Grammar?' [Misc]

a="JKL"

rules="A -> is
B -> mm
C -> oo
D -> rgr
E -> ryg
F -> dth
G -> you
H -> esol
I -> ionA
J -> GDaBarA
K -> veECFHutI
L -> PQ
M -> n
N -> m
O -> oaNcho
P -> MO
Q -> NR
R -> sky
S -> JKL"

r="s/"$(echo $rules |  sed 's/ -> /\//g;s/ /\/g;s\//g')"/g"

b=$(echo $a | sed ${r})

while [ $a != $b ]
do
    a=$b
    b=$(echo $a | sed ${r})
done 

echo $b
