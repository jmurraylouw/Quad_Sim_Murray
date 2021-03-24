close all

Ts_mpc = 0.03;
simulation_data_file = 'With_payload_data_12';
% simulation_data_file = 'With_payload_and_noise_data_2';
% simulation_data_file = 'With_payload_diff_params';
load(['Data/', simulation_data_file, '.mat']) % Load simulation data

start_time = 00;
end_time = 300;
q = 16;
p = 40;
y_rows = 1:4;
sigma = 0;
plot_prediction = 1;

% [A_dmd, B_dmd] = model_DMD(out, start_time, end_time, Ts_mpc, q, p, y_rows, sigma, plot_prediction);

%% Test DMD model
N_test = floor(10/Ts_mpc);
model_type = 'delay_B';
plot_and_pause = 1;
plot_results = 1;
results = model_MAE_accross_data(out, Ts_mpc, A_dmd, B_dmd, q, y_rows, N_test, model_type, plot_and_pause, plot_results);
stop

%% Test MPC model
% Change model structure so delays are included in A, not B 
nu = 2;
ny = length(y_rows);
A_mpc = [A_dmd,       B_dmd(:, 1:end-nu);
         eye((q-1)*ny),   zeros((q-1)*ny,ny)];

B_mpc = [B_dmd(:, end-nu+1:end); zeros((q-1)*ny, nu)];
C_mpc = eye(q*ny);
D_mpc = zeros(q*ny, nu);
mpc_sys = ss(A_mpc,B_mpc,C_mpc,D_mpc,Ts_mpc); % LTI system

N_test = 50;
model_type = 'delay_A';
plot_and_pause = 1;
plot_results = 1;
results = model_MAE_accross_data(out, Ts_mpc, A_mpc, B_mpc, q, y_rows, N_test, model_type, plot_and_pause, plot_results);
