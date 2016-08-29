#!/bin/python2.7

import sys
import math

n,k = raw_input().strip().split(' ')
n,k = [int(n),int(k)]
a = map(int,raw_input().strip().split(' '))
	
modk = [x%k for x in a]

# creating a dictionary : x%k -> number of repetitions
# for example
# if k = 3
# mod(num,3) == 0 :> 0 -> +=1
# mod(num,3) == 1 :> 1 -> +=1
# mod(num,3) == 2 :> 2 -> +=1

count = {}
for x in range(0,k):
	count[x] = 0

for x in range(0,n):
	count[modk[x]] += 1

for x in range(0,n):
	temp = modk[x]
	if (modk[x] == 0):
		temp = k
	
#print count
#print count2
# additional function to calculate the number of combinations
def nCr(n):
    if (n<2):
        return 0
    else:
	    return math.factorial(n)/(math.factorial(2)*math.factorial(n-2))
	
total = nCr(count2[0])

# the idea is behind:
# if k = 5
# 1-> 2 , 2->3 , 3->1, 4->0 
# this means that is you sum one value of key[0] with key[4]
# then this new number will be divisible by 5, since 0+4.
# but 4->0 , this means that total +=2*0
# on the other hand, 2->3 and 3->1 this implies total += 3*1
for x in range(1,int(math.ceil(k/2.0))):
	total += count[x] * count[k-x]

# counting the values	
if ((k-1) == k/2):
	total += nCr(count[k/2])

if (k%2 == 0 and (k-1) != k/2):
	total += nCr(count[k/2])

print total


