function [ F ] = getF( pts1, pts2 )
% 8-point algorithm

n = size(pts1, 1);

X1 = pts1(:, 1);
Y1 = pts1(:, 2);
X2 = pts2(:, 1);
Y2 = pts2(:, 2);

% solving homogenous system
A = [X1.*X2, X1.*Y2, X1, Y1.*X2, Y1.*Y2, Y1, X2, Y2, ones(n,1)];

% SVD to get fundamental matrix
[~,~,V] = svd(A);

% right singular vector corresponding to smaleest singular value
v = V(:,9);

% fundamental matrix from v
F = reshape(v,3,3);


