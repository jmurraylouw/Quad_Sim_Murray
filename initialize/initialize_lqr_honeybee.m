%% Initialise variables for LQR velocity control for honeybee quad

% Fran states = [Int(Vn_sp - Vn), Int(Ve_sp - Ve), Vn, Ve, dphi, phi, dtheta, theta]    
% states = [Int(Vn_sp - Vn), Vn, theta, dtheta]    

% g = positive = 9.81

% Run FFT to calculate pendulum length
% estimate_pendulum_length
% l_est = estimated length

% same format as lqr_cartpend from Steve Brunton control bootcamp youtube
% Int(Vn_sp - Vn), Vn,      theta,                  dtheta]
LQR.A= [    
            0      -1       0                       0;
            0       0       mp*g/mq                 0;
            0       0       0                       1;
            0       0       -1*(mp+mq)*g/(mq*l_est)     0
        ];


          % Fn
LQR.B = [
            0; 
            1/mq; 
            0; 
            -1/(mq*l_est)
        ];

%Q_lqr = diag([50*0.5 50*0.5 50*1 50*1 2/100 3/100 2/100 3/100]); %50 50 /100 /100 /100
%R_lqr = 3*diag([1 1]); %3 %%5 met 100 werk ook goed
%%Q_lqr = diag([1/(15^2) 1/(15^2) 1/(12^2) 1/(12^2) 2/((180*2*pi)^2) 3/((180*2*pi)^2) 2/((180*2*pi)^2) 3/((180*2*pi)^2)]);
%%R_lqr = diag([1/(max_total_T^2) 1/(max_total_T^2)]);

LQR.Q = diag([1 1 10 10]); % State weights
LQR.R = 3; % Input weights
LQR.K = lqr(LQR.A, LQR.B, LQR.Q, LQR.R)
%K = lqrd(Ass_aug, Bss_aug, Q_lqr, R_lqr, 1/sim_freq);








