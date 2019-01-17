function kalman_extended
close all 

time  = 10;
delta   = 0.1;
n_iter = time/delta;

p        = 4; % rx,ry,vx,vy  
m        = 2; % range, bearing

h_save      = zeros(n_iter, m);
xm_save      = zeros(n_iter, m);

K1_save      = zeros(n_iter,p);
K2_save      = zeros(n_iter,p);

Ppos_save    = zeros(n_iter, 1);
Pspeed_save  = zeros(n_iter, 1);

xe_save   = zeros(n_iter, p);
time_k      = zeros(n_iter, 1);


sigma_u    = 0.001;

sigma_R    = 1; % 1, 0.1, 0.1
sigma_Beta = 0.01;

R = [sigma_R, 0; 0, sigma_Beta]; % variance matrix, sensor noise

F   = [ 1, 0, delta, 0; 
        0, 1, 0, delta;
        0, 0, 1, 0 ;
        0, 0, 0, 1];

%   the first rows are zero since the first two have sensors, and the other are
% estimations from the observer 
Q   = [ 0, 0, 0, 0;
        0, 0, 0, 0;
        0, 0, sigma_u, 0 ;
        0, 0, 0, sigma_u];

% initial guesses
xe  = [ 5; 5; 0; 0 ];
P   =  100* eye(p);

% real values
pos_x = 10;
pos_y = -5;

vel_x = -0.2;
vel_y =  0.2;

rx = zeros(n_iter, 1);
ry = zeros(n_iter, 1);

for k = 1:n_iter
    time_k(k) = delta*k;

    % real values, line
    rx(k)    = pos_x + vel_x*delta*k;
    ry(k)    = pos_y + vel_y*delta*k;
  
    h_n   =  [  sqrt(rx(k)^2+ry(k)^2) ;
                atan2(ry(k) ,rx(k) )  ]; 

    % observations/ measurements
    noise  =  [ sigma_R*randn() ; sigma_Beta*randn() ];
    xm     =  h_n + noise;

    % Prediction
    xe   = F*xe; 
    P    = F*P*F' + Q; 

        % non-linear function 
    h_hat =  [  sqrt(xe(1,1)^2+xe(2,1)^2)  ; 
                atan2(xe(2,1) ,xe(1,1) )];
  
    rx_n    = rx(k); 
    ry_n    = ry(k); 

        % Jacobian of h
    H   =   [ rx_n/sqrt(rx_n^2+ry_n^2) , ry_n /sqrt(rx_n^2+ry_n^2) , 0, 0;
             -ry_n/(rx_n^2+ry_n^2),   rx_n/(rx_n^2+ry_n^2), 0, 0 ];


    % Update
    K   = P*H'/(H*P*H' + R);
    xe  = xe + K*(xm-h_hat);
    P   = ( eye(p) - K*H )*P;

    xe_save(k,:)    =  xe'; % [rx ,ry, vx,vy]
    h_save(k,:)     =  h_n';
    xm_save(k,:)    =  xm';
    K1_save(k,:)    =  K(:,1)';
    K2_save(k,:)    =  K(:,2)';
  
    Ppos_save(k)   = sqrt(P(1,1)^2+P(2,2)^2);  % position magnitude
    Pspeed_save(k) = sqrt(P(3,3)^2+P(4,4)^2);  % speed magnitude

end

figure
subplot(121); hold on
plot(time_k,sqrt( xe_save(:,1).^2 +xe_save(:,2).^2  ),'k-','LineWidth',2)
plot(time_k,h_save(:,1),'k--','LineWidth',2)
plot(time_k,xm_save(:,1),'ks','LineWidth',2)
title('Position Magnitude')
legend( 'Estimated','Real Value', 'Measurement')
xlabel('Time')
ylabel('Range')
grid on

subplot(122); hold on
plot(time_k,sqrt( xe_save(:,3).^2 +xe_save(:,4).^2  ),'k-','LineWidth',2)
speed = sqrt(vel_x^2 + vel_y^2) ;
plot( time_k , speed*ones(size(xe_save(:,2)) ) ,'k--','LineWidth',2)
title('Speed Magnitude')
legend( 'Estimated','Real Value')
xlabel('Time')
ylabel('Speed')
grid on


figure()
subplot(211); hold on
plot(time_k, K1_save(:,1) ,'k-','LineWidth',2)
plot(time_k, K1_save(:,2) ,'k+','LineWidth',2)
plot(time_k, K1_save(:,3) ,'k--','LineWidth',2)
plot(time_k, K1_save(:,4) ,'k.-','LineWidth',2)
legend('11','21','31','41')
title('Kalman Gains - Position')
xlabel('Time')
ylabel('K')
grid on

subplot(212); hold on
plot(time_k, K2_save(:,1) ,'k-','LineWidth',2)
plot(time_k, K2_save(:,2) ,'k+','LineWidth',2)
plot(time_k, K2_save(:,3) ,'k--','LineWidth',2)
plot(time_k, K2_save(:,4) ,'k.-','LineWidth',2)
title('Kalman Gains - Speed')
legend('11','21','31','41')
xlabel('Time')
ylabel('K')
grid on


figure
subplot(211)
plot(time_k, Ppos_save ,'k-','LineWidth',2)
xlabel('Time')
ylabel('MMSE range')
grid on

subplot(212)
plot(time_k, Pspeed_save ,'k-','LineWidth',2)
xlabel('Time')
ylabel('MMSE speed')
grid on

