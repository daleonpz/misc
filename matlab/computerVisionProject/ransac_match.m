function [matches, bestfit] = ransac_match(imleft, imright,threshold, rate )

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
bestfit = h_est 
matches.left =  imleft(inliers,:);
matches.right = imright(inliers,:);

