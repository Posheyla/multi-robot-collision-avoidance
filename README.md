# Multi-Robot Collision Avoidance

## ECE 555 – Robotics Final Project
North Carolina State University

### Project Objective

Comparative evaluation of ORCA and CBF-QP for decentralized multi-robot collision avoidance using differential-drive robots.

### Development Environment

- MATLAB
- MATLAB Optimization Toolbox (for the proposed QP implementation)
- CoppeliaSim
- Git and GitHub

### Project Modules

- `robot-model/`: Differential-drive kinematics and nominal controller.
- `cbf-controller/`: CBF-QP collision avoidance.
- `orca-controller/`: ORCA collision avoidance.
- `simulation/`: CoppeliaSim integration and visualization.
- `scenarios/`: Shared experimental scenarios.
- `evaluation/`: Performance metrics and comparative plots.

### Shared Files

- `main.m`: Main simulation and integration script.
- `config.m`: Shared robot, simulation, and safety parameters.

### Shared Data Format

- `X`: N x 3 matrix containing [x, y, theta].
- `goals`: N x 2 matrix containing target positions.
- `U_nom`: N x 2 matrix containing nominal [v, omega].
- `U`: N x 2 matrix containing final control commands.
- `U_prev`: Previous control commands.
- `params`: Shared configuration structure.

All implementations should use meters, seconds, and radians.

### Experimental Scenarios

1. Two robots crossing paths.
2. Four robots exchanging positions.
3. Narrow passage navigation (optional).

### Collaboration Guidelines

- Work on separate feature branches.
- Test individual modules before integration.
- Use pull requests to merge changes into the main branch.
- Discuss changes to shared interfaces and parameters with the team.
- Document assumptions and implementation limitations.

### Team Members

- Erik Guetz
- Luisa Chavez Vasquez
- Muhammad Moiz
- Noah Robertson

### Project Status

Under development.