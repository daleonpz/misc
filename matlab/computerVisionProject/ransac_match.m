function [inliers, bestfit] = ransac_match(imleft, imright )

A = 100*rand(100,1);
B = A*5 + 10; 
B = B + 20*randn(100,1);

% Ax = B

% I will test ransac with line
% m = Mxk, M is the number of samples
nInliers = 0;

numIterations = 0;

while( (nInliers < 70) && (numIterations < 100))

    m = size(A,1); 

    subsetIndex = randsample(m, 2);

    a = A(subsetIndex,:);
    b = B(subsetIndex,:);

    % least squares
    x = (a'*a)\a'*b;
     
    % finding inliers
    B_hat = A*x;
    inliers = sqrt(sum((B - B_hat).^2 ,2)) < 20;
    
    nInliers = sum(inliers);
    numIterations = numIterations + 1 ;
end 

numIterations
x 
figure; hold on
scatter( A,B)
scatter( A(inliers), B(inliers),'MarkerEdgeColor','b','MarkerFaceColor','c','LineWidth',1.5)

