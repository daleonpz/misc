function sinfo = scale_generateInfo(width, height, step, filter_size,surf_extras)

width           =floor(width);
height          =floor(height);
step            =floor(step);
filter_size     =floor(filter_size);

sinfo.width         = width;
sinfo.height        = height;
sinfo.step          = step;
sinfo.filter_size   = filter_size;


sinfo.responses = zeros(width * height,1);

b       = floor((filter_size - 1) / 2 + 1);         
l       = floor(filter_size / 3);                  
w       = filter_size;                      

normalisation_factor = 1 / double(w * w);  
img     =   surf_extras.img;
 
[ac,ar] = ndgrid(1:sinfo.width,1:sinfo.height); %is faster than meshgrid
ar=ar(:); ac=ac(:);

% get the image coordinates
r = ar * step;
c = ac * step;

% Compute response components
Dxx =   II_conv(r - l, c - b, 2 * l - 1, w,img) - II_conv(r - l, c - fix((l+1)/ 2), 2 * l - 1, l, img) * 3;
Dyy =   II_conv(r - b, c - l, w, 2 * l - 1,img) - II_conv(r - fix((l+1)/ 2), c - l, l, 2 * l - 1, img) * 3;
Dxy = + II_conv(r - l - 1, c - l - 1, l, l,img) + II_conv(r, c, l, l,img) ...
      - II_conv(r - l - 1, c, l, l,img) - II_conv(r, c - l -1, l, l,img);

% Normalise the filter responses with respect to their size
Dxx = Dxx*normalisation_factor;
Dyy = Dyy*normalisation_factor;
Dxy = Dxy*normalisation_factor;

% Get the determinant of hessian response 
sinfo.responses = (Dxx .* Dyy - 0.81 * Dxy .* Dxy);


end
