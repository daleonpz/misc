function an = find_extremum(r, c,  t,  m,  b,surf_extras)

% Function is written by D.Kroon University of Twente (July 2010)

% Top scale is the reference
% avoid points near boundaries
filter_offset = floor(  t.filter_size + 1 )  / (2*t.step) ; 
checkBounds = (r <= filter_offset | r >= t.height - filter_offset | c <= filter_offset | c >= t.width - filter_offset);

% check the candidate point in the middle layer is above thresh 
candidate       = scale_getResponse(m,r,c,t);
checkThreshold  = candidate < surf_extras.thresh;

an = (~checkBounds)&(~checkThreshold);

for rr = -1:1
    for  cc = -1:1
          %  if any response in 3x3x3 is greater then the candidate is not a maximum
          check1 = scale_getResponse(t,r + rr, c + cc, t) >= candidate;
          check2 = scale_getResponse(m,r + rr, c + cc, t) >= candidate;
          check3 = scale_getResponse(b,r + rr, c + cc, t) >= candidate;
          check4 = (rr ~= 0 || cc ~= 0);
          an3 = ~(check1 | (check4 & check2) | check3);
          an=an&an3;
    end
end

an = find(an);

end

