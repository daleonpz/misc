function s = taylor_interpolation(r, c,  t,  m,  b ,s)

D = taylor_getDerivative(r, c, t, m, b);
H = taylor_getHessian(r, c, t, m, b);

h = mat2cell(H,3, 3*ones(1,length(c)));

h = sparse(blkdiag(h{:}));

[x_hat,~] =cgs(h,D(:),1e-8); 

x_hat = -reshape(x_hat,[3 length(c)]);

filterStep = m.filter_size - b.filter_size;

x      = (c' + x_hat(1,:)) * t.step;
y      = (r' + x_hat(2,:)) * t.step;
scale  = 0.5*(m.filter_size + x_hat(3,:) * filterStep); 

h  = [x; y; scale]; 
h = mat2cell(h,[1 1 1],length(c));
temp = cell2struct(h,{'x','y','scale'});


s.x = [s.x temp.x];
s.y = [s.y temp.y];
s.scale = [s.scale temp.scale];

end

