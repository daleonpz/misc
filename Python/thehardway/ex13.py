#!/usr/bin/python2.7

from sys import argv

script, first, second, third = argv

print "The script is called:", script
print "Your first variable is:", first
print "Your second variable is:", second
print "Your third variable is:", third

y = raw_input("type something ")

print "I forgot one input \n",
print "this one: %r" % y
