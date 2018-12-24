function iimg = II_getIntegralImage(I)
 
% Create integral image

if (size(I,3) == 3) ; I = rgb2gray(I); end

iimg = cumsum(cumsum(I,1),2);
