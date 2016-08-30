#!/usr/bin/python2.7

q = int(raw_input())

for x in range(q):
	n = int(raw_input())
	m = []
	for k in range(2*n):
		m.append( [ int(i) for i in raw_input().split()  ]  )
	
	# it was a matter of computational time
	total = 0
	for j in range(n):
		for k in range(n):
			total += max ( m[j][k], m[j][-1-k], m[-1-j][k], m[-1-j][-1-k])
	
	
	
	
	#for k in range(n):
		# row k
	#	if ( sum(m[n+k][0:n]) > sum(m[n+k][n:2*n])  ):
		# do not forget that m is a list of list [ k0, k1,k2 k3]
	#		m[n+k].reverse()
	#print m
	# *m is convert m to tuples
	#m =  map(list,map(None,*m))
	
	#for k in range(n):
		# row k
	#	if ( sum(m[n+k][0:n]) < sum(m[n+k][n:2*n])  ):
		# do not forget that m is a list of list [ k0, k1,k2 k3]
	#		m[n+k].reverse()
	
	#print m
	# *m is convert m to tuples
	#m =  map(list,map(None,*m))
	
	#for k in range(n):
		# row k
	#	if ( sum(m[k][0:n]) < sum(m[k][n:2*n])  ):
		# do not forget that m is a list of list [ k0, k1,k2 k3]
	#		m[k].reverse()
	
	#print m
	#total = 0
	#for k in range(n):
	#	 total += sum(m[k][0:n])
		 
	print total
