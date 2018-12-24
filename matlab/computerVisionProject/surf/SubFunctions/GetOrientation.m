function ip = GetOrientation (ip,img,gauss)

% Get rounded InterestPoint data
X = round(ip.x);
Y = round(ip.y);
S = round(ip.scale);

filter  = repmat (gauss.filter, [1 length(X) ]);
j       = repmat (gauss.j, [1 length(X) ]);
i       = repmat (gauss.i, [1 length(X) ]);

X = repmat(X, [length(gauss.i) 1]);
Y = repmat(Y, [length(gauss.i) 1]);
S = repmat(S, [length(gauss.i) 1]);

resX = filter.* IntegralImage_HaarX(Y + j .* S, X + i .* S, 4 * S, img);
resY = filter.* IntegralImage_HaarY(Y + j .* S, X + i .* S, 4 * S, img);

% Approximation 
sumX = sum(resX,1);
sumY = sum(resY,1);  
%ip.orientation =  mod(atan2(sumY, sumX),2*pi);
ip.orientation =  atan2(sumY, sumX);


end


