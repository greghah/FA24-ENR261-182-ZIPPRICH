% Student: Gregory Zipprich
% Assisted by: Nobody

clc;
clear;
close all;

try
    % Prompt user for the initial velocity
    v0 = input('Enter the initial velocity (m/s): ');
    if ~isnumeric(v0) || v0 <= 0
        error('Initial velocity must be a positive number.');
    end
    
    % Prompt user for the launch angle
    angle = input('Enter the launch angle (degrees): ');
    if ~isnumeric(angle) || angle < 0 || angle > 90
        error('Launch angle must be between 0 and 90 degrees.');
    end
    
    % Prompt user for gravitational acceleration
    g = input('Enter gravitational acceleration (m/s^2): ');
    if ~isnumeric(g) || g <= 0
        error('Gravitational acceleration must be a positive number.');
    end
    
    % Call the projectile motion function
    projectileMotionWithKeyPoints(v0, angle, g);

catch ME
    % Handle errors gracefully
    disp('An error occurred:');
    disp(ME.message);
end
