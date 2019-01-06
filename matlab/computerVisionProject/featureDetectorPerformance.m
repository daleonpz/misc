function featureDetectorPerformance()
clear all
clc
% load dataset
N = 5;
I1 = cell(N,1);
I2 = I1;

I1{1} =  rgb2gray(double(imread('testimages/img1.jpg'))/255);
I1{2} =  rgb2gray(double(imread('testimages/roofs1.jpg'))/255);
I1{3} =  rgb2gray(double(imread('testimages/testc1.png'))/255);
I1{4} =  rgb2gray(double(imread('testimages/lena1.png'))/255);
I1{5} =  double( imread('cameraman.tif'))/255;

I2{1} =  rgb2gray(double(imread('testimages/img2.jpg'))/255);
I2{2} =  rgb2gray(double(imread('testimages/roofs2.jpg'))/255);
I2{3} =  rgb2gray(double(imread('testimages/testc2.png'))/255);
I2{4} =  rgb2gray(double(imread('testimages/lena2.png'))/255);
I2{5} =  imresize(imrotate(I1{5},-20),1.2);

tsurf = zeros(2,N);
tharris = tsurf;

nsurf = tsurf; % number of features
nharris = tsurf; 

% number of matches
nmatchesSurf = zeros(1,N);
nmatchesHarris = zeros(1,N);

for k = 1:N
    i1 = I1{k};
    i2 = I2{k};

    % SURF
    tic; surfPoints1 = detectSURFFeatures(i1);
    [surfFeatures1, valid_points1] = extractFeatures(i1,surfPoints1); tsurf(1,k)=toc;
    nsurf(1,k) = surfPoints1.Count;
    
    tic; surfPoints2 = detectSURFFeatures(i2);
    [surfFeatures2, valid_points2] = extractFeatures(i2,surfPoints2); tsurf(2,k)=toc;
    nsurf(2,k) = surfPoints2.Count;

    indexPairs = matchFeatures(surfFeatures1, surfFeatures2,'Prenormalized', true);
    nmatchesSurf(k) = size(indexPairs ,1);

    matchedPoints1 = valid_points1(indexPairs(:,1));
    matchedPoints2 = valid_points2(indexPairs(:,2));
    figure;
    subplot(121); showMatchedFeatures(I1{k},I2{k},matchedPoints1,matchedPoints2);
    title('SURF')
    legend('matched points 1','matched points 2');
%    PlotMatches(I1{k},I2{k},matchedPoints1.Location,matchedPoints2.Location);

    % Harris
    tic; harrisCorners1 = detectHarrisFeatures(i1);
    [harrisFeatures1, valid_points1] = extractFeatures(i1, harrisCorners1); tharris(1,k)=toc;
    nharris(1,k) = harrisCorners1.Count;

    tic; harrisCorners2 = detectHarrisFeatures(i2);
    [harrisFeatures2, valid_points2] = extractFeatures(i2, harrisCorners2); tharris(2,k)=toc;
    nharris(2,k) = harrisCorners2.Count;

    indexPairs = matchFeatures(harrisFeatures1, harrisFeatures2,'MaxRatio',0.8) ;
    nmatchesHarris(k) = size(indexPairs ,1);

    matchedPoints1 = valid_points1(indexPairs(:,1),:);
    matchedPoints2 = valid_points2(indexPairs(:,2),:);
    subplot(122); showMatchedFeatures(I1{k},I2{k},matchedPoints1,matchedPoints2);
    title('Harris + FREAK')
    legend('matched points 1','matched points 2');
 %   PlotMatches(I1{k},I2{k},matchedPoints1.Location,matchedPoints2.Location);

end 
    
tsurf
nsurf
nmatchesSurf

tharris
nharris
nmatchesHarris


end

function PlotMatches(I1, I2, matches1, matches2)
% Show both images
I = zeros([size(I1,1) size(I1,2)*2 size(I1,3)]);
I(:,1:size(I1,2),:)=I1; I(:,size(I1,2)+1:size(I1,2)+size(I2,2),:)=I2;

% Show both images
figure, imshow(I,[]); hold on;
for i=1:size(matches1,1)
      plot([ matches1(i,1)  matches2(i,1) + size(I1,2)],[ matches1(i,2) matches2(i,2)],...
                '-go',...
                'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',10)
end

end

%
%leftDataset = load('ZED_video_left.mat');
%rightDataset = load('ZED_video_right.mat');
%
%N = 4;
%tsurf = zeros(2,N);
%tharris = tsurf;
%
%nsurf = tsurf; % number of features
%nharris = tsurf; 
%
%% number of matches
%nmatchesSurf = zeros(1,N);
%nmatchesHarris = zeros(1,N);
%
%for k = 1:N
%    im = leftDataset.im(:,:,:,k);
%    i1 = rgb2gray( double(im)/255 );
%
%    im = rightDataset.im(:,:,:,k);
%    i2 = rgb2gray( double(im)/255 );
%
%    % SURF
%    tic; surfPoints1 = detectSURFFeatures(i1);
%    surfFeatures1 = extractFeatures(i1,surfPoints1); tsurf(1,k)=toc;
%    nsurf(1,k) = surfPoints1.Count;
%    
%    tic; surfPoints2 = detectSURFFeatures(i2);
%    surfFeatures2 = extractFeatures(i1,surfPoints2); tsurf(2,k)=toc;
%    nsurf(2,k) = surfPoints2.Count;
%
%    indexPairs = matchFeatures(surfFeatures1, surfFeatures2) ;
%    nmatchesSurf(k) = size(indexPairs ,1);
%
%    % Harris
%    tic; harrisCorners1 = detectHarrisFeatures(i1);
%    harrisFeatures1 = extractFeatures(i1, harrisCorners1); tharris(1,k)=toc;
%    nharris(1,k) = harrisCorners1.Count;
%
%    tic; harrisCorners2 = detectHarrisFeatures(i2);
%    harrisFeatures2 = extractFeatures(i2, harrisCorners2); tharris(2,k)=toc;
%    nharris(2,k) = harrisCorners2.Count;
%
%    indexPairs = matchFeatures(harrisFeatures1, harrisFeatures2) ;
%    nmatchesHarris(k) = size(indexPairs ,1);
%
%end 
%    
%tsurf
%nsurf
%nmatchesSurf
%
%tharris
%nharris
%nmatchesHarris
%
%
%
%
