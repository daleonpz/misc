function cvProject()

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

