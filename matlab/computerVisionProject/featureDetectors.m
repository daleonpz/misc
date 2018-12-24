function featureDetectors()

% load dataset
leftDataset = load('ZED_video_left.mat');
rightDataset = load('ZED_video_right.mat'); 

imleft = leftDataset.im(:,:,:,1);
imright = rightDataset.im(:,:,:,1);

I1=double(imleft)/255;
I2=double(imright)/255;
   
% Get the Key Points
  Options.tresh=0.0001;
  Ipts1=my_surf(I1,Options);
  Ipts2=my_surf(I2,Options);
% Put the landmark descriptors in a matrix
  D1 = Ipts1.descriptor;
  D2 = Ipts2.descriptor; 
% Find the best matches
  err=zeros(1,length(Ipts1.x));
  cor1=1:length(Ipts1.x); 
  cor2=zeros(1,length(Ipts1.x));
  for i=1:length(Ipts1.x),
      distance=sum((D2-repmat(D1(:,i),[1 length(Ipts2.x)])).^2,1);
      [err(i),cor2(i)]=min(distance);
  end
% Sort matches on vector distance
  [err, ind]=sort(err); 
  cor1=cor1(ind); 
  cor2=cor2(ind);
% Show both images
  I = zeros([size(I1,1) size(I1,2)*2 size(I1,3)]);
  I(:,1:size(I1,2),:)=I1; I(:,size(I1,2)+1:size(I1,2)+size(I2,2),:)=I2;
  figure, imshow(I,[]); hold on;
% Show the best matches
  for i=1:min(100,length(Ipts1.x))
      plot([Ipts1.x(cor1(i)) Ipts2.x(cor2(i))+size(I1,2)],[Ipts1.y(cor1(i)) Ipts2.y(cor2(i))],...
                '-mo',...
                'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',10)
      plot([Ipts1.x(cor1(i)) Ipts2.x(cor2(i))+size(I1,2)],[Ipts1.y(cor1(i)) Ipts2.y(cor2(i))],...
                '-mo',...
                'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',10)
  end
