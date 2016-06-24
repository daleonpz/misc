#!/usr/bin/python2.7

def print_list( N ,inc):
	numbers = []
	i = 0
	while i < N:
	        print "At the top i is %d" % i
	        numbers.append(i)
	        i = i + inc
	        print "Numbers now:", numbers
	        print "At the bottom i is %d" % i

i = 0
numbers = []

while i < 6:
	print "At the top i is %d" % i
	numbers.append(i)

	i = i + 1
	print "Numbers now:", numbers
	print "At the bottom i is %d" % i

# using the function

print_list(4,2)

print "The numbers: "

for num in numbers:
	print num
