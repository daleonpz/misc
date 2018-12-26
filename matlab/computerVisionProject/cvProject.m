function cvProject()
clear all
close all
clc

% load dataset
leftDataset = load('ZED_video_left.mat');
rightDataset = load('ZED_video_right.mat'); 

imleft = leftDataset.im(:,:,:,5);
imright = rightDataset.im(:,:,:,5);

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
    if ( ssd_candidates(1)/ssd_candidates(2) < 0.5) 
        matches(i) = ind_candidates(1);
    end

end

cor1 = matches>0;
cor2 = matches(matches>0); 

matchleft = double(surfPoints1.Location(cor1,:));
matchright =  double(surfPoints2.Location(cor2,:));

PlotMatches(I1, I2, matchleft, matchright);

[inliers, bestfit] = ransac_match(matchleft, matchright, 50, 0.7 );

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

ptsleft     = inv(k1)*[matchleft'; ones(1, size(matchleft,1))];
ptsright    = inv(k2)*[matchright'; ones(1, size(matchright,1))];


% Goal
% Camera matrices R|t
% P1 = [ I 0]
% P2 = [ R|t] ;
F = estimateFundamentalMatrix(matchleft, matchright);

% essential matrix to find P2
% property : E = U diag([1 1 0]) V'
E = k2'*F*k1;
[U,S,V] = svd(E);

% S is k diag([1 1 0])
W = [ 0 -1 0; 1 0 0; 0 0 1];
Z = [ 0 1 0; -1 0 0; 0 0 0];

% E = RS
% S = [ 0 -Tz Ty; Tz 0 -Tx; -Ty Tx 0]
% R = rotation matrix

% There are 4 solutions
S1 = -U*Z*U'; R1 = U*W'*V';
t1 = [S1(3,2); S1(1,3); S1(2,1)];
% det(R1) is not 1 is -1
P2_1 = [R1 t1];
S2 = U*Z*U' ; R2 = U*W*V';
t2 = [S2(3,2); S2(1,3); S2(2,1)];
P2_2 = [R2 t2];
P2_3 = [R1 t2];
P2_4 = [R2 t1];

P1 = [eye(3) zeros(3,1)];
P2 = P2_4;

P2_ = camera2(E);

X = zeros(4,size(matchleft,1));

for i=1:size(matchleft,1)
    A = [
        matchleft(i,1)*P1(3,:) - P1(1,:);
        matchleft(i,2)*P1(3,:) - P1(2,:);
        matchright(i,1)*P2(3,:) - P2(1,:);
        matchright(i,2)*P2(3,:) - P2(2,:)];

    [V,~] = eig(A);
    X(:,i) = V(:,1)/V(end,1);
end
figure
scatter3(X(1,:), X(2,:),X(3,:))

for i = 1:4
    P_ = triangulate(k1*P1, matchleft, k2*P2_(:,:,i), matchright);
    if all(P_(:,3) > 0)
        P = P_;
        P2 = P2_(:,:,i);
    end
end

P1 = k1*P1;
P2 = k2*P2;

figure
scatter3(P(:,1),P(:,2),P(:,3));

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

