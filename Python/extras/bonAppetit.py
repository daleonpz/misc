#!/usr/bin/python2.7

n, k = [int(x) for x in raw_input().split() ]

c = [int(x) for x in raw_input().split() ]

b = int(raw_input())

bactual = (sum(c)-int(c[k]))/2

if (b!=bactual):
	print b-bactual
else:
	print "Bon Appetit"



