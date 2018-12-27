function [P2] = getP2(E)

% property : E = U diag([1 1 0]) V'
[U,S,V] = svd(E);

% we must force S = diag([1 1 0])
% m = (S(1,1)+S(2,2))/2;
% E = U*[m,0,0;0,m,0;0,0,0]*V';
% [U,S,V] = svd(E);

% S is k diag([1 1 0])
W = [ 0 -1 0; 1 0 0; 0 0 1];
Z = [ 0 1 0; -1 0 0; 0 0 0];

%if ( det(U*V') < 0)
%   W = -W;
%end

% E = RS
% S = [ 0 -Tz Ty; Tz 0 -Tx; -Ty Tx 0]
% R = rotation matrix

%S1 = -U*Z*U'; 
R1 = U*W'*V';
R2 = U*W*V';
t = U(:,3);
%t = [S1(3,2); S1(1,3); S1(2,1)];
%t = t/max(t);

% There are 4 solutions
P2 = zeros(3,4,4);
P2(:,:,1) = [R1 t];
P2(:,:,2) = [R2 t];
P2(:,:,3) = [R1 -t];
P2(:,:,4) = [R2 -t];

for k = 1:4
    if ( det(P2(1:3,1:3,k))<0 )
        P2(1:3,1:3,k) = -P2(1:3,1:3,k);
    end
end

end
