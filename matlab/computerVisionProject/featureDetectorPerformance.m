function featureDetectorPerformance()

% load dataset
leftDataset = load('ZED_video_left.mat');

im = leftDataset.im(:,:,:,1);
I = double(im)/255;
   
% Get the Key Points
Options.tresh=0.0001;
Ipts   =   my_surf(I,Options);
% Put the landmark descriptors in a matrix
surfDescriptor = Ipts.descriptor;
surfPoints = detectSURFFeatures(rgb2gray(I));
harrisCorners = detectHarrisFeatures( rgb2gray(I));
    
figure, imshow(I,[]); hold on;
plot(surfPoints)

figure, imshow(I,[]); hold on;
plot(harrisCorners)
