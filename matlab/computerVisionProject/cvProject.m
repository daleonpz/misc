function cvProject()
clear all
close all
clc

% load dataset
leftDataset = load('ZED_video_left.mat');
rightDataset = load('ZED_video_right.mat'); 

imleft = leftDataset.im(:,:,:,1);
imright = rightDataset.im(:,:,:,1);

I1 = double(imleft)/255;
I2 = double(imright)/255;

i1 = rgb2gray(I1);
i2 = rgb2gray(I2);

% feature Detector and descriptor
surfPoints1 = detectSURFFeatures(i1); 
surfFeatures1 = extractFeatures(i1, surfPoints1); 

surfPoints2 = detectSURFFeatures(i2); 
surfFeatures2 = extractFeatures(i2, surfPoints2); 

D1 = surfFeatures1';
D2 = surfFeatures2';

% Find the best matches
N = surfPoints1.Count;
M = surfPoints2.Count; 

% pre processing
matches = zeros(N,1);

%for i=1:length(Ipts1.x),
for i=1:N
  distance=sum((D2-repmat(D1(:,i),[1 M])).^2,1);
    % ratio ssd -
    % bad candidates will have ratios near 1
    [ssd_candidates, ind_candidates] = sort(distance);
    if ( ssd_candidates(1)/ssd_candidates(2) < 0.75) 
        matches(i) = ind_candidates(1);
    end

end

cor1 = matches>0;
cor2 = matches(matches>0); 

matchleft = double(surfPoints1.Location(cor1,:));
matchright =  double(surfPoints2.Location(cor2,:));

PlotMatches(I1, I2, matchleft, matchright);
%showEpipolarLines(I1, I2, matchleft, matchright);

[inliers, bestfit] = ransac_match(matchleft, matchright, 10, 0.5 ); 

matchleft = inliers.left;
matchright = inliers.right;

PlotMatches(I1, I2, matchleft, matchright);


% intrinsic camera parameters
% P_image = ICP*P_real 
% P_dist = f(P_image)
k1 = [  1398.41 0 923.113;
            0 1398.41 550.247;
            0 0 1];


distorCoeffLeft = [-0.17121; 0.026171];

k2 = [ 1401.62 0 944.482;
            0 1401.62 548.772;
            0   0   1];

distorCoeffRight = [-0.16997; 0.024937];

p1    = k1\[matchleft'; ones(1, size(matchleft,1))];
p2    = k2\[matchright'; ones(1, size(matchright,1))];


% Goal
% Camera matrices R|t
% P1 = [ I 0]
% P2 = [ R|t] ;
F = estimateFundamentalMatrix(matchleft, matchright,'NumTrials',4000,'Method','RANSAC')
F = getF(matchleft, matchright)
% essential matrix to find P2
% property : E = U diag([1 1 0]) V'
E = k2'*F*k1;
P1 = [eye(3) zeros(3,1)];
P2_ = getP2(E);

for i = 1:4
    invP2 = inv([ P2_(:,:,i);[0 0 0 1] ]);
    pose = findPose( P1, p1, P2_(:,:,i), p2);

    % checking if the pose is in front of the camera
    P2test = invP2*pose; % reprojection to camera 2

    if all(pose(:,3) > 0) && all(P2test(:,3) > 0)
        P2 = P2_(:,:,i);
        break;
    end
end

figure
plot3(pose(1,:),pose(2,:),pose(3,:),'d');
axis equal;
axis vis3d;

end

function PlotMatches(I1, I2, matches1, matches2)
% Show both images
I = zeros([size(I1,1) size(I1,2)*2 size(I1,3)]);
I(:,1:size(I1,2),:)=I1; I(:,size(I1,2)+1:size(I1,2)+size(I2,2),:)=I2;

% Show both images
figure, imshow(I,[]); hold on;
for i=1:size(matches1,1)
      plot([ matches1(i,1)  matches2(i,1) + size(I1,2)],[ matches1(i,2) matches2(i,2)],...
                'mo',...
                'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',10)
end

end

