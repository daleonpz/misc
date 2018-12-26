function [inliers, bestfit] = ransac_match(imleft, imright )

% imleft = [x y]
% imright = [x y]
% imright = H*imleft
% m = Mxk, M is the number of samples
nInliers = 0;
numIterations = 0;

threshold = 10e-4; 
nSamples = 4;
m = size(imleft,1); 

H_full = [];  
for k = 1:m
    h = [imleft(k,:) 1]; 
    H_full = [H_full ; 
         h zeros(1,3) -imright(k,1)*h ;
         zeros(1,3) h -imright(k,2)*h]; 
end


while( (nInliers < (0.5)*m) && (numIterations < 100))


    subsetIndex = randsample(m, nSamples);

    p1 = imleft(subsetIndex,:);
    p2 = imright(subsetIndex,:); 

    % creating Homography matrix
    H = [];
    for k = 1:nSamples
        h = [p1(k,:) 1]; 
        H = [H ; 
             h zeros(1,3) -p2(k,1)*h ;
             zeros(1,3) h -p2(k,2)*h]; 
    end

    subset = [subsetIndex*2-1 subsetIndex*2]';

    hh = H_full(subset(:),:);

    % least square solution
    hth = H'*H;
    [V,~] = eig(hth);
    h_est = V(:,1);
     
    % finding inliers
    inliers =  abs(H_full*h_est) < threshold;
    nInliers = sum(inliers);
    numIterations = numIterations + 1 ;
end 

numIterations
h_est 


leftDataset = load('ZED_video_left.mat');
rightDataset = load('ZED_video_right.mat'); 

I1=double(leftDataset.im(:,:,:,1))/255;
I2=double(rightDataset.im(:,:,:,1))/255;
  
% Show both images
I = zeros([size(I1,1) size(I1,2)*2 size(I1,3)]);
I(:,1:size(I1,2),:)=I1; I(:,size(I1,2)+1:size(I1,2)+size(I2,2),:)=I2;
figure, imshow(I,[]); hold on;
% Show the best matches
for i=1:m
      plot([ imleft(i,1)  imright(i,1) + size(I1,2)],[ imleft(i,2) imright(i,2)],...
                '-mo',...
                'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',10)
end

% Show both images
figure, imshow(I,[]); hold on;


% Show the best matches
leftim = imleft(inliers,:);
rightim = imright(inliers,:);
for i=1:nInliers
      plot([ leftim(i,1)  rightim(i,1) + size(I1,2)],[ leftim(i,2) rightim(i,2)],...
                '-mo',...
                'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',10)
end
