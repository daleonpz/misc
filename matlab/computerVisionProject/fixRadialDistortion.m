function fixed = fixRadialDistortion(p, kd)

%p = matchleft;
%kd = distorCoeffLeft;
p_ant = zeros(size(p));
p_act = p;

nIt = 0;

while( (norm(p_ant(:) - p_act(:)) > 10e-3) || nIt < 100)
    p_ant = p_act;
    r = sum(p_act.^2,2).^0.5;
    dr = 1 + kd(1)*r.^2 + kd(2)*r.^4;
    p_act = p_act./[dr dr];
    
    nIt = nIt + 1;
end 

fixed = p_act;