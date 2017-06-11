#!/usr/bin/python2.7

# Challenge 'Listen To Me' [Crypto]
from PIL import Image
import numpy as np

im = Image.open("listen.png")
data = np.asarray( im.getdata(), dtype='uint8' )

s = im.size + (3,)
print data

d =   data[:,0:3]
d = d.reshape( s[0]*s[1]*s[2] ) 

d.tofile('listen.raw') # play it on audacity

