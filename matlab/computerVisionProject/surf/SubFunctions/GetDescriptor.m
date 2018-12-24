function ip = GetDescriptor(ip, img)

% Get rounded InterestPoint data
X = round(ip.x);
Y = round(ip.y);
S = round(ip.scale);

co = cos(ip.orientation);
si = sin(ip.orientation);

% Basis coordinates of samples, if coordinate 0,0, and scale 1
[lb,kb]=ndgrid(-4:4,-4:4); lb=lb(:); kb=kb(:);

%Calculate descriptor for this interest point
[jl,il]=ndgrid(0:3,0:3); il=il(:)'; jl=jl(:)';

ix = (il*5-8);
jx = (jl*5-8);

% 2D matrices instead of double for-loops, il, jl
cx=length(lb); cy=length(ix);
lb=repmat(lb,[1 cy]); lb=lb(:);
kb=repmat(kb,[1 cy]); kb=kb(:);
ix=repmat(ix,[cx 1]); ix=ix(:);
jx=repmat(jx,[cx 1]); jx=jx(:);

% Coordinates of samples (not rotated)
l=lb+jx; k=kb+ix;

m = length(X); n = length(ix);

X   = repmat(X  ,[n 1]);
Y   = repmat(Y  ,[n 1]);
S   = repmat(S  ,[n 1]);
co  = repmat(co ,[n 1]);
si  = repmat(si ,[n 1]);

ix = repmat(ix , [1 m]);
jx = repmat(jx , [1 m]);
k  = repmat(k  , [1 m]);
l  = repmat(l  , [1 m]);


%Get coords of sample point on the rotated axis
sample_x = round(X + (-l .* S .* si + k .* S .* co));
sample_y = round(Y + (l .* S .* co + k .* S .* si));
                
%Get the gaussian weighted x and y responses
xs = round(X + (-(jx+1) .* S .* si + (ix+1) .* S .* co));
ys = round(Y + ((jx+1) .* S .* co + (ix+1) .* S .* si));

gauss_s1 = SurfDescriptor_Gaussian(sample_x- xs , sample_y -ys  , 3.3 * S);
rx = IntegralImage_HaarX(sample_y, sample_x, 2 * S,img);
ry = IntegralImage_HaarY(sample_y, sample_x, 2 * S,img);
                
%Get the gaussian weighted x and y responses on the aligned axis
rrx = gauss_s1 .* rx; 
rry = gauss_s1 .* ry;  

dx = zeros(cy,m); 
dy = zeros(cy,m); 
mdx = zeros(cy,m);
mdy = zeros(cy,m); 

for ll = 1:cy
    foox = rrx( 1+(ll-1)*cx  : cx*ll,: ); 
    fooy = rry( 1+(ll-1)*cx  : cx*ll,: );
    dx(ll,:) = sum(foox,1);
    dy(ll,:) = sum(fooy,1);
    mdx(ll,:) = sum(abs(foox),1);
    mdy(ll,:) = sum(abs(fooy),1);
end


descriptor = [dx;dy;mdx;mdy];
len = sqrt(sum((dx.^2 + dy.^2 + mdx.^2 + mdy.^2)));

%Convert to Unit Vector, invariance to contrast
ip.descriptor = descriptor ./ repmat(len,[64 1]);


function an= SurfDescriptor_Gaussian(x, y, sig)

an = exp(-(x.^2 + y.^2) ./ (2 * sig.^2))./(2 * pi * sig.^2);
