function [] = kalman_reset(ver)
%close all
clc

if (nargin < 1)
    ver = 1;
end
m = 1800;
n = 1:m;
K = 800;

T = 1;

s_rho = 1e8;
s_theta = 25;

V = 600;  %Velocidad radial

%Rumbo
R = 330;

%Ruido Blanco
v_rho = s_rho^0.5*randn(size(n));
v_theta = s_theta^0.5*randn(size(n));

%Valores Iniciales
rho  = 400000;
theta = 150;

% Generacion de datos
x(1) = rho*sin(theta*pi/180);
y(1) = rho*cos(theta*pi/180);

for k = 2:K
    x(k) = x(k-1) + V*sin(R*pi/180)*T;
    y(k) = y(k-1) + V*cos(R*pi/180)*T;
end

 R = 200;

for k = K+1:m
    x(k) = x(k-1) + V*sin(R*pi/180)*T;
    y(k) = y(k-1) + V*cos(R*pi/180)*T;
end


x = 39700 +x;
y = -68762 +y;
%plot(n,y,n,x)
%Datos reales
r(1,:) = sqrt( x.^2 + y.^2 );
r(2,:) = (180/pi) *angle(y+1i*x); 

%Datos observados
rm(1,:) = r(1,:) + v_rho;
rm(2,:) = r(2,:) + v_theta;

if  ver == 1
    re = kalman1(s_rho,s_theta,rm,m,r,n);
else
    re = kalman2(s_rho,s_theta,rm,m,r,n);
end
plotResults (x,y,  re, rm, n, m, r)

end

function [re]= kalman1(s_rho,s_theta,rm,m,r,n)
% Prediccion
re(1,1) = 400000; %rho
re(2,1) = 150;% angle
re(3,1) = 600;% radial speed
re(4,1) = 330;% direction

% Covariance Matrix, uncentainty around predictions
P =  diag([s_rho,s_theta,s_rho,s_theta]);%eye(4);

% http://www.bzarg.com/p/how-a-kalman-filter-works-in-pictures/
% A = F, predicton matrix
A = [1 0 1 0; 0 1 0 1; 0 0 1 0; 0 0 0 1];
% C = H , for unit scalation between reading and estimation
C = [1 0 0 0;0 1 0 0 ]; 

% sensor noise
R = [s_rho 0 ; 0 s_theta];

for k = 2:m
    % next state
    % Prediction : 
    re(:,k) = A*re(:,k-1); 
    P = A*P*A'; 
  
    % Update: 
    % Calculando la ganancia Kalman
    K = P*C'/( C*P*C' + R); 

    % Correccion basada en la observacion
    %re(:,k) = re(:,k) + K*(rm(:,k) - C*re(:,k)); % from tutorial
    re(:,k) = re(:,k) + K*(rm(:,k) - re(1:2,k));
    P = (eye(4) - K*C)*P;
end

end

function [re]= kalman2(s_rho,s_theta,rm,m,r,n)
% Prediccion
re(1,1) = 400000;
re(2,1) = 150;
re(3,1) = 600;
re(4,1) = 330;

P =  diag([s_rho,s_theta,s_rho,s_theta]);%eye(4);

A = [1 0 1 0; 0 1 0 1; 0 0 1 0; 0 0 0 1];
C = [1 0 0 0;0 1 0 0 ]; 

R = [s_rho 0 ; 0 s_theta];

for k = 2:m
    re(:,k) = A*re(:,k-1); 
    P = A*P*A'; 
  
    % Calculando la ganancia Kalman
    K = P*C'/( C*P*C' + R); 

    % Correccion basada en la observacion
    re(:,k) = re(:,k) + K*(rm(:,k) - re(1:2,k));
    P = (eye(4) - K*C)*P;
    
        if  abs(re(2,k) - rm(2,k)) > s_theta*4
                re(1,k) = 400000;
                re(2,k) = -150;  
                re(3,k) = 600;
                re(4,k) = 200;

          P = diag([s_rho,s_theta,s_rho,s_theta]);

        end
    
end

end


function plotResults (x,y,re, rm, n, m, r)
linewidth = 3; 
figure
plot(y,x,'LineWidth', linewidth)
hold on
y = re(1,:) .* cosd (re(2,:));
x = re(1,:) .* sind (re(2,:));
yn = rm(1,:) .*cosd (rm(2,:));
xn = rm(1,:) .*sind (rm(2,:));
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
