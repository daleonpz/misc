#!/usr/bin/python2.7 

import numpy as np
import cv2 

cap = cv2.VideoCapture(0)

def edges(frame):
    gaussian = cv2.GaussianBlur(frame,(5,5),0)
    laplacian = cv2.Laplacian(gaussian,cv2.CV_64F)
    return laplacian

def enhance_frame( frame, laplacian):
    lap = frame - laplacian
    lap = lap - lap.min()
    lap = lap/ lap.max()
    img2 = lap*255

    equ = cv2.equalizeHist(img2.astype(np.uint8))
    
    return equ

while (True):
    # Capture frame-by-frame
    ret, frame = cap.read()

    # Our operations on the frame come here
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    myEdge = edges(gray)
    enhanced = enhance_frame (gray, myEdge)

    width = 320
    height = 240
    img1 = cv2.resize(gray, (width, height) );
    img2 = cv2.resize(enhanced, (width, height));
    img3 = cv2.resize(myEdge, (width, height));
    alles = np.hstack((img1/225.0,  img2/255.0, img3))
    
    cv2.imshow('Output', alles)
    
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()
