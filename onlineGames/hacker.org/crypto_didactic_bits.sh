#!/bin/bash

# Challenge 'Didactic Bits' [Crypto]

a="abbbabaaabbabaaaabbaababaabaaaaaabbaaaababbabbbaabbbaabbabbbabbbabbaabababbbaabaaabaaaaaabbabaababbbaabbaabaaaaaabbaaaababbaabaaabbbabababbabbababbaaabaabbbaabaabbaaaababbbabaaabbaabab"

echo $a | sed 's/\(.\)/\1\n/g'  | sort | uniq -c | sort

code=$(echo $a | sed -r 's/(.{8})/\1 /g' | tr 'ab' '01')

# 100 a
#  84 b

# 184 = 2 2 2 23 > 23 bytes


chrbin() {
        echo $(printf \\$(echo "ibase=2; obase=8; $1" | bc))
}

bin2ascii() {
    for bin in $*
    do
        chrbin $bin | tr -d '\n'
    done
}

bin2ascii $code

