function [inliers, bestfit] = ransac_match(imleft, imright,threshold, rate )

% imleft = [x y]
% imright = [x y]
% imright = H*imleft
% m = Mxk, M is the number of samples
nInliers = 0;
numIterations = 0;

% threshold = 10e-4; 
nSamples = 4;
m = size(imleft,1); 

H_full = [];  
for k = 1:m
    h = [imleft(k,:) 1]; 
    H_full = [H_full ; 
          zeros(1,3) -h imright(k,2)*h;
          h zeros(1,3) -imright(k,1)*h];
end


while( (nInliers < rate*m) && (numIterations < 100))

    subsetIndex = randsample(m, nSamples);
    subset = [subsetIndex*2-1 subsetIndex*2]';

    % Homeography subsample
    H = H_full(subset(:),:);

    % least square solution
    hth = H'*H;
    [V,~] = eig(hth);
    h_est = V(:,1);

    % normalization
    h_est = reshape(h_est,[3 3])'/h_est(end);

    % finding inliers
    est = h_est*[imleft'; ones(1,m)];
    % normalization
    est = [est(1,:)./est(end,:) ;est(2,:)./est(end,:)]';

    inliers = sum(( imright - est).^2,2).^0.5 < threshold;
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
