function pose = findPose( P1, p1, P2, p2 )

n = size(p1,2);

P = zeros(4,n);

for i=1:n
    % skew matrix
    % S = [ 0 -Tz Ty; Tz 0 -Tx; -Ty Tx 0]

	p1x = [   0           p1(3,i)     -p1(2,i); 
            -p1(3,i)    0           p1(1,i); 
            p1(2,i)     -p1(1,i)    0];

	p2x = [   0           p2(3,i)     -p2(2,i); 
            -p2(3,i)    0           p2(1,i); 
            p2(2,i)     -p2(1,i)    0];

	A = [p1x*P1; p2x*P2];

	[~,~,V] = svd(A);
	z = V(:,end);
	P(:,i) = z/z(4);
end


pose = P;

end
