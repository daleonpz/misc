#!/bin/bash

# Challenge 'One Minute Man' [Web]

# 24 hours 60 minutes
for min in {0..1440}
do
    t=$(printf " %02d:%02d" $(( (min/60)%24)) $((min%60)) )
    curl -z "20160401 $t:00" http://www.hacker.org/challenge/misc/minuteman.php
done
