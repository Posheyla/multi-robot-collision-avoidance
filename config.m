
function params = config()

    %% Simulation parameters
    params.dt = 0.05;           % Time step [s]
    params.T_max = 60;          % Maximum time [s]
    params.max_steps = ceil(params.T_max / params.dt);

    %% Differential-drive robot
    params.robot_radius = 0.15; % Robot radius [m]
    params.wheel_radius = 0.05; % Wheel radius [m]
    params.wheel_base = 0.25;   % Wheel separation [m]

    %% Velocity constraints
    params.v_max = 0.5;         % [m/s]
    params.v_min = 0.0;         % [m/s]
    params.omega_max = 1.5;     % [rad/s]

    %% Safety parameters
    params.safety_margin = 0.10;
    params.d_safe = 2 * params.robot_radius ...
                    + params.safety_margin;

    params.neighbor_range = 3.0; % [m]

    %% Goal-reaching parameters
    params.goal_tolerance = 0.10; % [m]

    %% Nominal controller
    params.k_v = 0.8;
    params.k_omega = 2.0;

    %% CBF parameters
    params.cbf.gamma = 2.0;

    %% ORCA parameters
    params.orca.time_horizon = 3.0;

    %% Reproducibility
    params.seed = 42;

end
