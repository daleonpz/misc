#!/usr/bin/python2.7

import numpy as np
import cv2 
from matplotlib import pyplot as plt

import timeit

def myconv2D(img,kernel):
    nrows = img.shape[0];
    ncols = img.shape[1];

    # Square kernel
    krows = kernel.shape[0];
    kcols = kernel.shape[1];
    kcenterX = kcols/2;
    kcenterY = krows/2;

    result = np.empty( img.shape);

    for i in range(0, nrows):
        for j in range(0,ncols):
            for m in range(0, krows):
                # row index of flipped kernel
                mm = krows - 1 - m;
                for n in range(0,kcols):
                    # column index of flipped kernel
                    nn = kcols - 1 -n;

                    # index of input signal, used for checking boundary
                    ii = i + (m - kcenterY);
                    jj = j + (n - kcenterX);
                
                    # ignore input samples which are out of bound
                    if( ii >= 0 and ii < nrows and jj >= 0 and jj < ncols ):
                        result[i][j] += img[ii][jj] * kernel[mm][nn];

    return result


# Read image
img = cv2.imread('../images/lena.png',0)

##########################
#   Kernel 2D
##########################
kernel = np.array([ [1,4,6,4,1],
                        [4,16,24,16,4],
                        [6,24,26,24,6],
                        [4,16,24,16,4],
                        [1,4,6,4,1]])/256.0;

start = timeit.default_timer()
img2D= myconv2D(img, kernel);
stop = timeit.default_timer()
print "Elapsed time conv 2D: %f secs " % (stop - start)

##########################
#   Separable Kernel
##########################
kernelX = np.array([[1,4,6,4,1]])/16.0;
kernelY = np.array([[1],[4],[6],[4],[1]])/16.0;

start = timeit.default_timer()
imgX = myconv2D(img,kernelX);
imgSep= myconv2D(imgX, kernelY);
stop = timeit.default_timer()

print "Elapsed time Separable conv %f secs " %(stop - start)

# Calculating error between both results
dist = np.linalg.norm(img2D-imgSep,'fro')
dist /= img.shape[0]*img.shape[1]
print "Error between two methods: %f " % (dist)

# Plotting the results
plt.subplot(1,3,1),plt.imshow(img, cmap = 'gray')
plt.title('Original'), plt.xticks([]), plt.yticks([])
plt.subplot(1,3,2),plt.imshow(img2D, cmap = 'gray')
plt.title('Gaussian 2D'), plt.xticks([]), plt.yticks([])
plt.subplot(1,3,3),plt.imshow(imgSep, cmap = 'gray')
plt.title('Gaussian Sep'), plt.xticks([]), plt.yticks([])
plt.show()


