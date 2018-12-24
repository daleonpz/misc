function D = taylor_getDerivative(r,c,t,m,b)
  
% Function is written by D.Kroon University of Twente ()

dx = (scale_getResponse(m,r, c + 1, t)  - scale_getResponse(m,r, c - 1, t)) / 2;
dy = (scale_getResponse(m,r + 1, c, t)  - scale_getResponse(m,r - 1, c, t)) / 2;
ds = (scale_getResponse(t,r, c,t)       - scale_getResponse(b,r, c, t)) / 2;

D = [dx';dy';ds'];
