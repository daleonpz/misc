function [] = kalman_reset(ver)

if (nargin < 1)
    ver = 1;
end

n_iter  = 2000;
delta   = 1;
total_t = n_iter*delta;

n = 1:total_t;
K = round(total_t/2);

s_rho = 1e8; % range
s_theta = 25; % bearing

V = 600; % radial speed 
R = 330; % direction 

% white noise
v_rho = s_rho^0.5*randn(size(n));
v_theta = s_theta^0.5*randn(size(n));

% Initial values
rho  = 400000;
theta = 150;

x = zeros(total_t,1);
y = x;

% Real Values
x(1) = rho*sin(theta*pi/180);
y(1) = rho*cos(theta*pi/180);

for k = 2:K
    x(k) = x(k-1) + V*sin(R*pi/180)*delta;
    y(k) = y(k-1) + V*cos(R*pi/180)*delta;
end

R = 200; % new direction

for k = K+1:total_t
    x(k) = x(k-1) + V*sin(R*pi/180)*delta;
    y(k) = y(k-1) + V*cos(R*pi/180)*delta;
end

y_offset = max(y); 
x_offset = x(y==y_offset);

% send the curve to the center
x = x - x_offset;
y = y - y_offset;

% range, bearing
r(1,:) = sqrt( x.^2 + y.^2 );
r(2,:) = (180/pi) *angle(y+1i*x); 

% Observations
rm(1,:) = r(1,:) + v_rho;
rm(2,:) = r(2,:) + v_theta;

re = kalman(s_rho,s_theta,rm,total_t, ver);

plotResults (x,y,  re, rm, n, total_t, r)

end

function [re]= kalman(s_rho,s_theta,rm,m, version)
% Prediccion
re(1,1) = 400000; % radial distance
re(2,1) = 150;% angle
re(3,1) = 600;% noise in radial distance
re(4,1) = 330;% noise in angle

% Covariance Matrix, uncentainty around predictions
P = diag([s_rho,s_theta,s_rho,s_theta]);

% Predicton matrix
F = [1 0 1 0; 0 1 0 1; 0 0 1 0; 0 0 0 1];

% For unit scalation between reading and estimation
H = [1 0 0 0;0 1 0 0 ]; 

% sensor noise
R = [s_rho 0 ; 0 s_theta];

for k = 2:m
    % Prediction : 
    re(:,k) = F*re(:,k-1); 
    P       = F*P*F'; 
  
    % Update: 
    K       = P*H'/( H*P*H' + R); % Kalman Gain
    re(:,k) = re(:,k) + K*(rm(:,k) - re(1:2,k));
    P       = (eye(4) - K*H)*P;

    if ( version == 2)
        if  abs(re(2,k) - rm(2,k)) > s_theta*4
                re(1,k) = 400000;
                re(2,k) = -150;  
                re(3,k) = 600;
                re(4,k) = 200;

              P = diag([s_rho,s_theta,s_rho,s_theta]);

        end
    end
 end

end


function plotResults (x,y,re, rm, n, m, r)

linewidth = 3; 
figure; plot(y,x,'b','LineWidth', linewidth)
hold on
y = re(1,:) .* cosd (re(2,:));
x = re(1,:) .* sind (re(2,:));
yn = rm(1,:) .*cosd (rm(2,:));
xn = rm(1,:) .*sind (rm(2,:));

%plot(yn,xn,'g:', 'LineWidth', linewidth)
%plot(y,x,'r', 'LineWidth', linewidth)

plot(yn(25:m),xn(25:m),'g:', 'LineWidth', linewidth)
plot(y(25:m),x(25:m),'r', 'LineWidth', linewidth)

title('Trajectory')
legend('Real value','Measurement', 'Estimated')


mse_pos = abs(re(1,:) - r(1,:));
mse_angle = abs(re(2,:) - r(2,:));

figure
subplot(1,2,1)
plot(n,re(1,:),n,rm(1,:),'g:',n,r(1,:),'r', 'LineWidth',linewidth)
legend( 'Estimated','Measurement','Real value')
title('Position')

subplot(1,2,2)
plot(n,mse_pos,'r','LineWidth', linewidth)
title('MSE Position')


figure
subplot(1,2,1)
plot(n,re(2,:),n,rm(2,:),'g:',n,r(2,:),'r','LineWidth', linewidth)
title('Angle')
legend( 'Estimated','Measurement', 'Real value')

subplot(1,2,2)
plot(n,mse_angle,'r','LineWidth', linewidth)
title('MSE Angle')


end
