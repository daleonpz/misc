function featureDetectorPerformance()

% load dataset
leftDataset = load('ZED_video_left.mat');

im = leftDataset.im(:,:,:,1);
I = rgb2gray( double(im)/255 );

% SURF
tic; surfPoints = detectSURFFeatures(I);
surfFeatures = extractFeatures(I,surfPoints); toc

% Harris
tic; harrisCorners = detectHarrisFeatures(I);
harrisFeatures = extractFeatures(I, harrisCorners); toc
    
figure, imshow(I,[]); hold on;
plot(surfPoints)

figure, imshow(I,[]); hold on;
plot(harrisCorners)
