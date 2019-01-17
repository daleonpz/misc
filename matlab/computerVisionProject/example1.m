I=double(imread('huella.pgm'))/255;
I = rgb2gray(double(imread('lena.png'))/255);
 
% Get the Key Point
Options.thresh = 0.001;
tic; Ipts   =   my_surf(I,Options);  t=toc
length(Ipts.x)
 
figure, imshow(I,[]); hold on;
title('My implementation')
plot(Ipts.x,Ipts.y,...
                'mo',...
                'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',10)
PaintSURF(I, Ipts)

% Put the landmark descriptors in a matrix
tic; surfPoints = detectSURFFeatures(I); 
surfFeatures = extractFeatures(I,surfPoints); t = toc
tic; harrisCorners = detectHarrisFeatures(I); 
[harrisFeatures, validcorners] = extractFeatures(I, harrisCorners); t = toc

figure, imshow(I,[]); hold on;
plot(surfPoints)

figure, imshow(I,[]); hold on;
plot(harrisCorners)

figure, imshow(I,[]); hold on;
plot(validcorners);
