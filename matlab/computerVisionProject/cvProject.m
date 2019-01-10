function cvProject()
clear all
close all
clc

% load dataset
leftDataset = load('ZED_video_left.mat');
rightDataset = load('ZED_video_right.mat'); 

imleft = leftDataset.im(:,:,:,1);
imright = rightDataset.im(:,:,:,1);

%imleft = imread('/home/dnl/Desktop/todelete/left.png');
%imright = imread('/home/dnl/Desktop/todelete/right.png');
%imleft = imleft(1:470, 1:318, :);
%imright = imright(1:470, 1:318, :);

I1 = double(imleft)/255;
I2 = double(imright)/255;

i1 = rgb2gray(I1);
i2 = rgb2gray(I2);

% feature Detector and descriptor
surfPoints1 = detectSURFFeatures(i1); 
[ surfFeatures1, valid_points1 ] = extractFeatures(i1, surfPoints1); 

surfPoints2 = detectSURFFeatures(i2); 
[ surfFeatures2, valid_points2 ] = extractFeatures(i2, surfPoints2); 

D1 = surfFeatures1';
D2 = surfFeatures2';


%harrisCorners1 = detectHarrisFeatures(i1);
%[ harrisFeatures1, valid_points1 ] = extractFeatures(i1, harrisCorners1); 
%harrisCorners2 = detectHarrisFeatures(i2);
%[ harrisFeatures2, valid_points2 ] = extractFeatures(i2, harrisCorners2); 
%
%D1 = harrisFeatures1.Features';
%D2 = harrisFeatures2.Features';
%
% Find the best matches
N = valid_points1.Count;
M = valid_points2.Count; 


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

matchleft = double(valid_points1.Location(cor1,:));
matchright =  double(valid_points2.Location(cor2,:));

PlotMatches(I1, I2, matchleft, matchright);
%showEpipolarLines(I1, I2, matchleft, matchright);

[inliers, bestfit] = ransac_match(matchleft, matchright, 10, 0.5 ); 

matchleft = inliers.left;
matchright = inliers.right;

PlotMatches(I1, I2, matchleft, matchright);

% Get Fundamental Matrix
F = getF(matchleft, matchright)

aa = diag([matchright ones(size(matchright,1),1)]*F*[matchleft ones(size(matchleft,1),1)]');
sum(aa)/size(matchright,1)

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

% essential matrix to find P2
% property : E = U diag([1 1 0]) V'
E = k2'*F*k1;

%matchleft = fixRadialDistortion(matchleft, distorCoeffLeft);
%matchright = fixRadialDistortion(matchright, distorCoeffRight);

% Normalized Image Points
p1    = k1\[matchleft'; ones(1, size(matchleft,1))];
p2    = k2\[matchright'; ones(1, size(matchright,1))];

% Camera matrices R|t
% P1 = [ I 0]
P1 = [eye(3) zeros(3,1)];

% P2 = [ R|t] ;
P2_ = getP2(E);

figure
for i = 1:4
    pose = findPose( P1, p1, P2_(:,:,i), p2);
    % pose [ X, lambda1, lambda2] 
    
    % Camera perspective
    subplot(1,4,i)
    plot3(pose(1,:),-pose(2,:),pose(3,:),'d');
    axis equal;
    axis vis3d;
    
    % checking if the pose is in front of the camera
    P2test = [ P2_(:,:,i);[0 0 0 1] ]\pose; % reprojection to camera 2
  
    if all(pose(3,:) > 0) && all(P2test(3,:) > 0)
    %if all(pose(3,:) > 0)
        P2 = P2_(:,:,i)
        title('True Pose')
        %break;
    end
       
end

%axis equal;
%axis vis3d;

figure
imshow(I1,[]); hold on
n = 40;
plot(matchleft(1:end,1),matchleft(1:end,2),'o',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',10)

% for i=1:n
%     text(matchleft(i,1), matchleft(i,2),...
%         mat2str(abs(round( pose(1:3,i)'.*[10 10 10]))),...
%         'Color','g',...
%     'BackgroundColor',[0 0 0]);
% end

end

function PlotMatches(I1, I2, matches1, matches2)
% Show both images
I = zeros([size(I1,1) size(I1,2)*2 size(I1,3)]);
I(:,1:size(I1,2),:)=I1; I(:,size(I1,2)+1:size(I1,2)+size(I2,2),:)=I2;

% Show both images
figure, imshow(I,[]); hold on;
for i=1:size(matches1,1)
      plot([ matches1(i,1)  matches2(i,1) + size(I1,2)],[ matches1(i,2) matches2(i,2)],...
                '-mo',...
                'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',10)
end

end

