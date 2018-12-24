function PaintSURF(I, ip)
% This function PaintSURF will display the image with the found  Interest points
%
% [] = PaintSURF( img,ipts )
%  
%  inputs,
%    img : Image 2D color or greyscale
%    ipts : The interest points
%  
% Function is written by D.Kroon University of Twente (July 2010)

% Convert Image to double

figure, imshow(I), hold on;

for i=1:size(ip.x,2) 

   S = fix(ip.scale(i))*2;
   R = fix(S / 2);

   pt =  [ip.x(i), ip.y(i)];
   ptR = [(R * cos(ip.orientation(i))), (R * sin(ip.orientation(i)))];

   if(ip.laplacian(i) >0), myPen =[0 0 0]; else myPen =[0 0 1]; end
   
   rectangle('Curvature', [1 1],'Position', [pt(1)-R, pt(2)-R, S, S],'EdgeColor',myPen,'LineWidth',2);
   
    plot([pt(1), pt(1)+ptR(1)]+1,[pt(2), pt(2)+ptR(2)]+1,'y','LineWidth',2);
end
