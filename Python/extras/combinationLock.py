#!/usr/bin/python2.7

current = [int(x) for x in raw_input().split()]
desired = [int(x) for x in raw_input().split()]

total = 0
for x in range(0,len(current)):
	tmp = abs(current[x]-desired[x]) 
	total += abs(10*(tmp>=5)-(tmp))

print total

#9 - 2 >=5 -> true :> 10-(9-2)
#5 -0 >=5 :> false > 5-0
#8-7 >= 5 :> false > 8-7
#7-1 >= 5 :> true > 10-(7-1) = 4
#2-8 >= 5 :> true > 10 -(6) = 4
