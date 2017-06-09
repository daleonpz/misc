#!/usr/bin/bash

# Challenge 'One Minute Man' [Web]

# 24 hours 60 minutes

a=$(curl http://www.hacker.org/challenge/misc/minuteman.php | sed 's/<.*>//g')
b=$a

while [ "$a" == "$b" ] 
do
    a=$(curl http://www.hacker.org/challenge/misc/minuteman.php | sed 's/<.*>//g')
    sleep 30
done

echo $a

## i declare the answer is gugglemuggle

