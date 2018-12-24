function H = taylor_getHessian (r, c, t, m, b)
% Modified by Daniel Paredes 
% Function is written by D.Kroon University of Twente ()

v = scale_getResponse(m, r, c, t);
dxx = scale_getResponse(m,r, c + 1, t) + scale_getResponse(m,r, c - 1, t) - 2 * v;
dyy = scale_getResponse(m,r + 1, c, t) + scale_getResponse(m,r - 1, c, t) - 2 * v;
dss = scale_getResponse(t,r, c,t) + scale_getResponse(b,r, c, t) - 2 * v;
dxy = (scale_getResponse(m,r + 1, c + 1, t) - scale_getResponse(m,r + 1, c - 1, t) - scale_getResponse(m,r - 1, c + 1, t) + scale_getResponse(m,r - 1, c - 1, t)) / 4;
dxs = (scale_getResponse(t,r, c + 1,t) - scale_getResponse(t,r, c - 1,t) - scale_getResponse(b,r, c + 1, t) + scale_getResponse(b,r, c - 1, t)) / 4;
dys = (scale_getResponse(t,r + 1, c,t) - scale_getResponse(t,r - 1, c,t) - scale_getResponse(b,r + 1, c, t) + scale_getResponse(b,r - 1, c, t)) / 4;


H = [dxx dxy dxs dxy dyy dys dxs dys dss]';
 
H = reshape(H, 3,3*length(r)); 

