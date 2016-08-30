#!/usr/bin/python2.7

import re

q = int(raw_input())


for x in range(q):
	a = raw_input()
	# b : only UPPERCASE 
	b = raw_input()
	msg = "YES"
	
	for k in range(len(b)):
		xo = b[k]
		idx = a.find(xo);
		if( idx == -1):
			idx = a.upper().find(xo)
			if( idx == -1):
				msg = "NO"
				break
			else:
				if (any( [x for x in a[:idx] if x.isupper() ] ) ):
					msg = "NO"
					break
				else:
					a = a[(idx+1):]
		else:
			if (any( [x for x in a[:idx] if x.isupper() ] ) ):
				msg = "NO"
				break
			else:
				a = a[(idx+1):]

	if(any( [x for x in a if x.isupper() ] ) ):
		msg = "NO"
	print msg
