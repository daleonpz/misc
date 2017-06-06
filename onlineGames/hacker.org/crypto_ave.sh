#!/bin/bash

# Challenge 'Ave' [Crypto]

a="Icqrb lryqna rb fjh, fjh qjamna cqjw axc cqracnnw. qnan, hxd wnena twxf qxf oja cx bqroc! xq kh cqn fjh, cqn jwbfna rb mnjmvjwblqnbc. "

# find the word that correspond to ANSWER
echo $a |  sed 's/[,.\r]//g' | tr ' ' '\n' | sort  | uniq -c | awk '{ print $1 "\t"  length($2) "\t" $2}' | awk '$2==6'

# 1	6	bqroc!
# 1	6	jwbfna
# 1	6	lryqna
# 1	6	qjamna

## a->r, n->e


# then I used THE and IS to find the basic matches and the I iterate
echo $a |  sed 's/[,.\r]//g' | tr ' ' '\n' | sort  | uniq -c | awk '{ print $1 "\t"  length($2) "\t" $2}' | awk '$2==3'

# 1	3	axc
# 2	3	cqn
# 3	3	fjh
# 1	3	hxd
# 1	3	oja
# 1	3	qxf

## cqn > the
## rot 17

echo $a |  tr '[j-za-i]' '[A-Z]'






