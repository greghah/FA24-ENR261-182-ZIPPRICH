% Student: Gregory Zipprich
% Assisted by: Nobody

clear
clc

% Define parameters for launch
v0 = input('Enter the initial velocity (in m/s): ');
y0 = input('Enter the initial height (in meters): ');
numValues = 100; % Number of divisions for the x-axis
g = 9.81; % Gravitational acceleration constant
angles = 0:5:90; % Vector of launch angles in degrees

% Create a ranges vector with the same size as the angles vector
ranges = zeros(size(angles));

% Calculate trajectory for each angle using a for loop, and calculate range
for i = 1:length(angles)
    angle = angles(i);
    
    % Calculate the trajectory for the current angle
    [x, y, total_time] = calculateTrajectory(v0, angle, y0, g, numValues);
    
    % Calculate the range by setting it equal to the final x position
    ranges(i) = x(end);
end

% Analyze trajectories by calling the analyzeTrajectories function
[aboveAverageAngles, maxRange, optimalAngle] = analyzeTrajectories(angles, ranges);

% Display results
fprintf('Angles with above-average ranges: %s\n', mat2str(aboveAverageAngles));
fprintf('Maximum range achieved: %.2f meters\n', maxRange);
fprintf('Optimal angle for maximum range: %.2f degrees\n', optimalAngle);
