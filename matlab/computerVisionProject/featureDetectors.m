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

  N = length(Ipts1.x);
  M = length(Ipts2.x);

  matches = zeros(N,1);

  for i=1:length(Ipts1.x),
      distance=sum((D2-repmat(D1(:,i),[1 M])).^2,1);
         % ratio ssd 
        % bad candidates will have ratios near 1
        [ssd_candidates, ind_candidates] = sort(distance);
        if ( ssd_candidates(1)/ssd_candidates(2) < 0.5) 
            matches(i) = ind_candidates(1);
        end

  end

  cor1 = find(matches>0);
  cor2 = matches(matches>0); 
  
% Show both images
  I = zeros([size(I1,1) size(I1,2)*2 size(I1,3)]);
  I(:,1:size(I1,2),:)=I1; I(:,size(I1,2)+1:size(I1,2)+size(I2,2),:)=I2;
  figure, imshow(I,[]); hold on;
% Show the best matches
  for i=1:length(cor1)
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
