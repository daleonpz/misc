function ipts = DescribeInterestPoints(ipts, img)

if (isempty(fields(ipts))), return; end

gauss = GenerateGaussMaskForOrientation;
 
ipts = GetOrientation(ipts,img,gauss);
ipts = GetLaplacianSign(ipts,img);
ipts = GetDescriptor(ipts, img); % matrix (64 x npoints)


end


function ipts = GetLaplacianSign(ipts,img)
% in  Taylor_interpolation.m 
% scale  =  0.5*(m.filter_size + x_hat(3,:) * filterStep);

    w       = floor(ipts.scale)*2;
    b       = floor((w - 1) / 2 + 1);         
    l       = floor(w / 3);                  
          
    normalisation_factor = w .* w; 
    % get the image coordinates
    r = ipts.y ; % son los puntos ya escalados
    c = ipts.x ;

    Dxx =   + II_conv(r - l + 1, c - b, 2 * l - 1, w,img) ...
            - II_conv(r - l + 1, c - fix(l / 2), 2 * l - 1, l, img) * 3;
    Dyy =   + II_conv(r - b, c - l + 1, w, 2 * l - 1,img) ...
            - II_conv(r - fix(l / 2), c - l + 1, l, 2 * l - 1,img) * 3;
        
    Dxx = Dxx./normalisation_factor;
    Dyy = Dyy./normalisation_factor;
    
    ipts.laplacian = (Dxx + Dyy) >= 0;
end


