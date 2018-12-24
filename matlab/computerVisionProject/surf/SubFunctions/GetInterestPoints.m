function ipts = GetInterestPoints(surf_extras)

filter_map =    [1,2,3,4;
                2,4,5,6;
                4,6,7,8;
                6,8,9,10;
                8,10,11,12];


ipts.x = [];
ipts.y = [];
ipts.scale = [];
ipts.laplacian = [];
ipts.orientation = [];
ipts.descriptor = [];

scaleInfo = scale_getScaleInfo(surf_extras);

% Find the maxima acrros scale and space
for o = 1:surf_extras.octaves
    for i = 1:2
        b = scaleInfo{filter_map(o,i)};
        m = scaleInfo{filter_map(o,i+1)};
        t = scaleInfo{filter_map(o,i+2)};
        
        % loop over middle response layer at density of the most
        % sparse layer (always top), to find maxima across scale and space
        [c,r] = ndgrid(0:t.width-1,0:t.height-1); % row major
        r = r(:); c = c(:);
        
        p = find_extremum(r, c, t, m, b,surf_extras);
        
        ipts = taylor_interpolation(r(p), c(p),  t,  m,  b ,ipts);
       
      
    end
end
