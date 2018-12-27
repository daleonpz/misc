%load stereoPointPairs
function showEpipolarLines(I1, I2, matched_points1, matched_points2)

%matched_points1 = matchleft(1:end,:);
%matched_points2 = matchright(1:end,:);
[fLMedS, inliers] = estimateFundamentalMatrix(matched_points1,matched_points2,'NumTrials',4000,'Method','RANSAC');
  
% Show the inliers in the first image.
%I1 = imread('viprectification_deskLeft.png');
    figure; 
    subplot(121); imshow(I1); title('Inliers and Epipolar Lines in First Image'); hold on;
    plot(matched_points1(inliers,1), matched_points1(inliers,2), 'go')
  
    % Compute the epipolar lines in the first image.
    epiLines = epipolarLine(fLMedS', matched_points2(inliers, :));
  
    % Compute the intersection points of the lines and the image border.
    pts = lineToBorderPoints(epiLines, size(I1));
  
    % Show the epipolar lines in the first image
    line(pts(:, [1,3])', pts(:, [2,4])');
 
    % Show the inliers in the second image.
%    I2 = imread('viprectification_deskRight.png');
    subplot(122); imshow(I2); title('Inliers and Epipole Lines in Second Image'); hold on;
    plot(matched_points2(inliers,1), matched_points2(inliers,2), 'go')
  
    % Compute and show the epipolar lines in the second image.
    epiLines = epipolarLine(fLMedS, matched_points1(inliers, :));
    pts = lineToBorderPoints(epiLines, size(I2));
    line(pts(:, [1,3])', pts(:, [2,4])');
 
    truesize;


k1 = [  1398.41 0 923.113;
            0 1398.41 550.247;
            0 0 1];

k2 = [ 1401.62 0 944.482;
            0 1401.62 548.772;
            0   0   1];

p1 = matched_points1(inliers,:);
p2 = matched_points2(inliers,:);

p1    = k1\[p1 ones(size(p1,1),1)]';
p2    = k2\[p2 ones(size(p2,1),1)]';


% Goal
% Camera matrices R|t
% P1 = [ I 0]
% P2 = [ R|t] ;
F = fLMedS
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
title('Epipolar')


