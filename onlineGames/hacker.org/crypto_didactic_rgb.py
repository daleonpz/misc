#!/usr/bin/python2.7

# Challenge 'Didactic RGB' [Crypto]
from PIL import Image
import numpy as np

im = Image.open("didactrgb.png")
data = np.asarray( im.getdata(), dtype='uint8' )[0]

print data[0]*256**2 + data[1]*256 + data[2]
