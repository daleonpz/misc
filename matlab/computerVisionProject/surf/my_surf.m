function ipts = my_surf(img,Options)
%
% Written by Daniel Paredes - 2014
% based on Dirk-Jan Kroon matlab implementation
% Copyright (c) 2010, Dirk-Jan Kroon
% All rights reserved.
  
if nargin<2
    Options.thresh = 0.0001;
    Options.octaves = 5;
    Options.init_sample = 2;
else
    Options = checkoptions(Options);
end

% Create Integral Image
iimg    =   II_getIntegralImage(img);

% Extract the interest points
surf_extras.thresh              = Options.thresh;
surf_extras.octaves             = Options.octaves;
surf_extras.init_sample         = Options.init_sample;
surf_extras.img                 = iimg;
 
ipts = GetInterestPoints(surf_extras);

ipts = DescribeInterestPoints(ipts,iimg);

end

function Options = checkoptions(Options)

    if ~isfield(Options,'thresh'), Options.thresh = 0.0001; end
    if ~isfield(Options,'octaves'), Options.octaves = 5; end
    if ~isfield(Options,'init_sample'), Options.init_sample = 2; end
end

