function scaleInfo = scale_getScaleInfo(surf_extras)

% Calculate responses for each scale
% Oct1: 9,  15, 21, 27
% Oct2: 15, 27, 39, 51
% Oct3: 27, 51, 75, 99
% Oct4: 51, 99, 147,195
% Oct5: 99, 195,291,387

nscales     = 4 + (surf_extras.octaves-1)*2;

scaleInfo =  cell(nscales,1);

nscales     = [4*ones(1,4) 5:nscales] - 4 ; 
nscales     = 2.^ceil(nscales/2); 

w = (size(surf_extras.img,2) / surf_extras.init_sample);
h = (size(surf_extras.img,1) / surf_extras.init_sample);
s = (surf_extras.init_sample);

filter_size  = 3 + 6*cumsum(nscales);

for k = 1:length(nscales)
    step = nscales(k);
    scaleInfo{k} = scale_generateInfo(w/step, h/step, s*step , filter_size(k) ,surf_extras);
end

end 


