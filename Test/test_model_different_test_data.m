%% Test HAVOK.m with different test data ranges

% Extract data
reload_data = 0; % Re-choose csv data file for SITL data
save_model = 0; % 1 = Save this model , 0 = dont save
extract_data;

for start_time = 1:10:300
    
    % Training data
    train_time = time_offset+(0:Ts:300)';
    y_train = resample(y_data, train_time );% Resample time series to desired sample time and training period  
    u_train = resample(u_data, train_time );  
    % pos_sp.x = resample(pos_sp_data, train_time );  

    t_train = y_train.Time';
    N_train = length(t_train);

    y_train = y_train.Data';
    u_train = u_train.Data';
    % pos_sp.x = pos_sp.x.Data';

    % Testing data
    test_time = start_time+(0:Ts:60)';
    y_test = resample(y_data, test_time );  
    u_test = resample(u_data, test_time );  
    t_test = y_test.Time';
    N_test = length(t_test); % Num of data samples for testing

    y_test = y_test.Data';
    u_test = u_test.Data';

    % Position data (not in y)
    % p_test = resample(p_data, test_time );  
    % p_test = p_test.Data';

    % Remove offset / Centre input around zero

    % hover_time = (0:Ts:50)+10; % Time in which uav is just hovering
    % u_hover = resample(u_data, hover_time); % Data where uav is at standstill hovering
    % u_bar = mean(u_hover.Data);
    u_bar = mean(u_train, 2);
    u_train = u_train - u_bar;
    % u_test = u_test - u_bar;

    % Re-calculate u_bar for test data, because acc_sp offset drifts
    u_bar_test = mean(u_test, 2);
    u_test = u_test - u_bar_test;

    try
        load(results_file);
        results(~results.q,:) = []; % remove empty rows

        % Parameters
        best_row = find(results.MAE_mean == min(results.MAE_mean));
        best_results = results(best_row,:);
        q = double(best_results.q);
        p = double(best_results.p);

        iterate_p = 0;
        if iterate_p
            'Iterate p -------------------------------------------------------'
            p = try_p;
        end

        only_q_Ts = 0; % Try best result for specific q
        if only_q_Ts
            'Chosen q --------------------------------------------------------'
            q = 20;
            q_results = results((results.q == q & results.Ts == Ts),:);
            best_row = find(q_results.MAE_mean == min(q_results.MAE_mean));
            best_results = q_results(best_row,:)
            p = double(best_results.p);
        end

        override = 0;
        if override
            'Override --------------------------------------------------------'
            q = 16
            p = 7

        end
        % % Override parameters:
        % q = 80
        % p = 40

        q
        p

    catch
        disp('No saved results file')  
    end

    w = N_train - q + 1; % num columns of Hankel matrix
    D = (q-1)*Ts; % Delay duration (Dynamics in delay embedding)

    % Create Hankel matrix with measurements
    Y = zeros((q)*ny,w); % Augmented state Y[k] at top
    for row = 0:q-1 % Add delay coordinates
        Y((end - ny*(row+1) + 1):(end - ny*row), :) = y_train(:, row + (1:w));
    end

    Upsilon = u_train(:, q:end); % Leave out last time step to match V_til_1
    YU_bar = [Y; Upsilon];

    % SVD of the Hankel matrix
    [U1,S1,V1] = svd(YU_bar, 'econ');
    figure(1), semilogy(diag(S1), 'x'), hold on;
    title('Singular values of Omega, showing p truncation')
    plot(p, S1(p,p), 'ro'), hold off;

    % Truncate SVD matrixes
    U_tilde = U1(:, 1:p); 
    S_tilde = S1(1:p, 1:p);
    V_tilde = V1(:, 1:p);

    % Setup V2 one timestep into future from V1
    V_til_2 = V_tilde(2:end  , :)'; % Turnd on side (wide short matrix)
    V_til_1 = V_tilde(1:end-1, :)';

    % DMD on V
    AB_tilde = V_til_2*pinv(V_til_1); % combined A and B matrix, side by side
    AB_tilde = stabilise(AB_tilde,3);

    % Convert to x coordinates
    AB_havok = (U_tilde*S_tilde)*AB_tilde*pinv(U_tilde*S_tilde);

    % System matrixes from HAVOK
    A_havok = AB_havok(1:q*ny, 1:q*ny);
    B_havok = AB_havok(1:q*ny, q*ny+1:end);
    A_havok = stabilise(A_havok,10);

    % Make matrix sparse
    A_havok(ny+1:end, :) = [eye((q-1)*ny), zeros((q-1)*ny, ny)]; % Add Identity matrix to carry delays over to x(k+1)
    B_havok(ny+1:end, :) = zeros((q-1)*ny, nu); % Input has no effect on delays

    %% Add position state (with integration) for MPC tracking position
    A_havok = [zeros( num_axis, size(A_havok,2) ); A_havok]; % Add top row zeros
    A_havok = [zeros( size(A_havok,1), num_axis ), A_havok]; % Add left column zeros
    B_havok = [zeros( num_axis, size(B_havok,2) ); B_havok]; % Add top row zeros

    % Numeric integration: pos(k+1) = pos(k) + Ts*vel(k)
    A_havok(1:num_axis, 1:num_axis)            =    eye(num_axis); % 1*pos(k)
    A_havok(1:num_axis, num_axis+(1:num_axis)) = Ts*eye(num_axis); % Ts*vel(k)

    %% Add payload angular velocity for MPC tracking position
    A_havok = [zeros( num_axis, size(A_havok,2) ); A_havok]; % Add top row zeros
    A_havok = [zeros( size(A_havok,1), num_axis ), A_havok]; % Add left column zeros
    B_havok = [zeros( num_axis, size(B_havok,2) ); B_havok]; % Add top row zeros

    % Numeric differentiation: dtheta(k+1) approx.= dtheta(k) = 1/Ts*theta(k) - 1/Ts*theta(k-1)
    A_havok(1:num_axis, 3*num_axis+(1:num_axis)) =  1/Ts*eye(num_axis); % 1/Ts*theta(k)
    A_havok(1:num_axis, 5*num_axis+(1:num_axis)) = -1/Ts*eye(num_axis); % - 1/Ts*theta(k-1)

    %% Save model
    if save_model
        model_file = [uav_folder, '/models/havok_model_', simulation_data_file, '_q', num2str(q), '_p', num2str(p), '.mat'];
        save(model_file, 'A_havok', 'B_havok', 'Ts_havok', 'q', 'p', 'ny', 'nu', 'u_bar')
        disp('model saved')
    end
    %% Run with HAVOK (A_havok, B_havok and x)
    % figure;
    % for i = 1:q*p-1
    %     plot(V1(:,i))
    %     pause
    % end
    % 
    % title('First 5 modes of SVD')

    %% Compare to testing data
    % Initial condition (starts at index = q of training data)
    y_hat_0 = zeros(q*ny,1); % Y[k] at top
    for row = 0:q-1 % First column of spaced Hankel matrix
        y_hat_0(row*ny+1:(row+1)*ny, 1) = y_test(:,q-row);
    end

    % Add initial position to top
    % y_hat_0 = [p_test(:,q); y_hat_0];
    y_hat_0 = [0; y_hat_0]; % Add placeholder

    % Add initial angular velocity to top
    switch num_axis
        case 1 % y_test = [vx; angle_x ... delays]
            dtheta_0 = 1/Ts * y_test(2, q)  -  1/Ts * y_test(2, q-1); % initial angular velocity
        case 2 % y_test = [vx; vy; angle_x; angle_y... delays]
            dtheta_0 = 1/Ts * y_test([3 4], q)  -  1/Ts * y_test([3 4], q-1); % initial angular velocity
    end
    y_hat_0 = [dtheta_0; y_hat_0];

    % Run model
%     figure
    Y_hat = zeros(length(y_hat_0),N_test); % Empty estimated Y
    Y_hat(:,q) = y_hat_0; % Initial condition
    for k = q:N_test-1
        Y_hat(:,k+1) = A_havok*Y_hat(:,k) + B_havok*u_test(:,k);
    %     plot(t_test, Y_hat(1:(ny+num_axis), :))
    %     legend('pos', 'vel', 'theta')
    %     pause
    end

    y_hat_bar = Y_hat(1:(ny+2*num_axis), :); % Extract only non-delay time series and position

    % Vector of Mean Absolute Error on testing data
    switch num_axis
        case 1
            MAE = sum(abs(y_hat_bar(3:end,:) - y_test), 2)./N_test % For each measured state
        case 2
            MAE = sum(abs(y_hat_bar(5:end,:) - y_test), 2)./N_test % For each measured state
    end

    %% Plot training data
    % close all;
    % 
    % figure;
    % plot(t_train, y_train);
    % title(['HAVOK - Train y - ', simulation_data_file]);
    % 
    % figure;
    % plot(t_train, u_train);
    % title(['HAVOK - Train u - ', simulation_data_file]);
    % legend('x', 'y', 'z')


    %% Plot preditions
    for i = 1:ny
        figure(i+1);
        plot(t_test, y_test(i,:), 'b');
        hold on;
        plot(t_test, y_hat_bar(i+2*num_axis,:), 'r--', 'LineWidth', 1);
        plot(t_test, u_test, 'k');
        hold off;
        legend('actual', 'predicted', 'acc_sp.x')
        title(['HAVOK - Test y', num2str(i), ' - ', simulation_data_file]);
    end

    %% Plot angle and angular velocity
    % figure, hold on
    % plot(t_test, y_test(2,:))
    % plot(t_test, y_hat_bar(1,:))
    % legend('angle_x', 'angle_x velocity')
    % title('angle and angular velocity')
    % hold off
    
    start_time
    pause
end
    
function A = stabilise(A_unstable,max_iterations)
    % If some eigenvalues are unstable due to machine tolerance,
    % Scale them to be stable
    A = A_unstable;
    count = 0;
    while (sum(abs(eig(A)) > 1) ~= 0)       
        [Ve,De] = eig(A);
        unstable = abs(De)>1; % indexes of unstable eigenvalues
        De(unstable) = De(unstable)./abs(De(unstable)) - 10^(-14 + count*2); % Normalize all unstable eigenvalues (set abs(eig) = 1)
        A = Ve*De/(Ve); % New A with margininally stable eigenvalues
        A = real(A);
        count = count+1;
        if(count > max_iterations)
            break
        end
    end

end