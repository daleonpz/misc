I=double(imread('huella.pgm'))/255;
 
% Get the Key Point
Options.thresh = 0.001;
tic; Ipts   =   my_surf(I,Options); t1 = toc
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
tic; surfPoints = detectSURFFeatures(I); t2=toc
tic; harrisCorners = detectHarrisFeatures(I); t2=toc
    
figure, imshow(I,[]); hold on;
plot(surfPoints)

figure, imshow(I,[]); hold on;
plot(harrisCorners)
