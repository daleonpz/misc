#!/usr/bin/python2.7

from sys import argv
from os.path import exists

script, from_file, to_file = argv

#we could do these two on one line, how?
#in_file = open(from_file)
#indata = in_file.read()

# Done, task above
#indata = open(from_file).read()

#out_file = open(to_file,'w')
#out_file.write(indata)

# testing oneliner
indata = open(from_file).read()
open(to_file,'w').write(indata)

print "Alright, all done."

#out_file.close()
