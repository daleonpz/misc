function output=scale_getResponse(baseScale,row, column,refScale)

scale   = floor(baseScale.width/refScale.width);
index   = row*scale*baseScale.width + column*scale+1;

index(index>length(baseScale.responses)) = length(baseScale.responses);
index(index<1) = 1;


output = baseScale.responses(index);
