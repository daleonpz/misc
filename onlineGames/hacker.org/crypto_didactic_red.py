#!/usr/bin/python2.7

# Challenge 'Didactic Red' [Crypto]
from PIL import Image
import numpy as np

im = Image.open("redline.png")
data = np.asarray( im.getdata(), dtype='uint8' )
print data[:,0]
print ''.join([format( int(x), '02x') for x in data[:,0] ])
