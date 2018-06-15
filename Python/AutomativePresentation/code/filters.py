#!/usr/bin/python2.7 

import numpy as np
import cv2 
from matplotlib import pyplot as plt

img = cv2.imread('../images/cameraman.png',0)

gaussian = cv2.GaussianBlur(img,(5,5),0)
laplacian = cv2.Laplacian(img,cv2.CV_64F)
laplacianofG = cv2.Laplacian(gaussian,cv2.CV_64F)


lap = img - laplacianofG
lap = lap - lap.min()
lap = lap/ lap.max()
img2 = lap*255

equ = cv2.equalizeHist(img2.astype(np.uint8))

plt.subplot(1,4,1),plt.imshow(img, cmap = 'gray')
plt.title('Original'), plt.xticks([]), plt.yticks([])
plt.subplot(1,4,2),plt.imshow(abs(gaussian), cmap = 'gray')
plt.title('Gaussian'), plt.xticks([]), plt.yticks([])
plt.subplot(1,4,3),plt.imshow(abs(laplacian), cmap = 'gray')
plt.title('Laplacian'), plt.xticks([]), plt.yticks([])
plt.subplot(1,4,4),plt.imshow(abs(laplacianofG),cmap = 'gray')
plt.title('Laplacian of Gaussian'), plt.xticks([]), plt.yticks([])
plt.show()
