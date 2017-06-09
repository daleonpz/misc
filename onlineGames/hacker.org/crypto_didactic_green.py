#!/usr/bin/python2.7

# Challenge 'Didactic Green' [Crypto]
from PIL import Image
import numpy as np

im = Image.open("greenline.png")
data = np.asarray( im.getdata(), dtype='uint8' )
print ''.join([ str(unichr(int(x))) for x in data[:,1] ])
