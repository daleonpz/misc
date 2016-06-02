#!/usr/bin/python2.7

x = "There are %d types of people." % 10 # replace %d for 10
binary = "binary"
do_not = "don't"
y = "Those who know %s and those who %s." %( binary, do_not)

print x
print y

print "I said %r." %x # is basically '%s', at least in this example
print "I also said: '%s'." %y

hilarious = False
joke_evaluation = "Isn't that joke so funny?! %r"

print joke_evaluation % hilarious
#this is quiet usefull, it is some kind of function. Note that hilarius is Boolean
# but in the end, %r stands for raw data

w = "The is the left side of..."
e = "a string with a right side."

print w+e
