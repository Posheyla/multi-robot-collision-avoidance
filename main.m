
clear;
clc;
close all;

%% Setup
addpath(genpath(pwd));

params = config();
rng(params.seed);

%% Select method and scenario
method = "CBF";       % "CBF", "ORCA", "Nominal"
scenario = "crossing"; % "crossing", "exchange"

%% Initialize robots
switch scenario
    case "crossing"
        [X, goals] = crossing_scenario();

    case "exchange"
        [X, goals] = position_exchange();
end

N = size(X, 1);
U_prev = zeros(N, 2);

%% Initialize data storage
history.X = X;
history.U = zeros(N, 2, 0);
history.t = 0;

%% Simulation loop
for k = 1:params.max_steps

    % Nominal controller
    U_nom = nominal_controller(X, goals, params);

    % Collision avoidance
    switch method
        case "CBF"
            U = cbf_controller(X, U_nom, ...
                               U_prev, params);

        case "ORCA"
            U = orca_controller(X, U_nom, ...
                                U_prev, params);

        case "Nominal"
            U = U_nom;
    end

    % Update robot states
    X = robot_model(X, U, params);

    % Store data
    history.X(:,:,k+1) = X;
    history.U(:,:,k) = U;
    history.t(k+1) = k * params.dt;

    U_prev = U;

    % Check goal completion
    errors = vecnorm(X(:,1:2) - goals, 2, 2);

    if all(errors < params.goal_tolerance)
        break;
    end

end

%% Performance evaluation
metrics = calculate_metrics(history, goals, params);

disp(metrics);

plot_results(history, goals, params);
