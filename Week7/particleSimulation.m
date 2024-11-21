% particleSimulation.m

% Define parameters
numParticles = 3; % Number of particles
numTimeSteps = 100; % Number of time steps

% Simulate particle motion
particles = simulateParticleMotion(numParticles, numTimeSteps);

% Save particle data to MAT file
save('particleData.mat', 'particles');

% Load particle data from MAT file
load('particleData.mat', 'particles');

% Initialize table to store average velocities
avgVelocities = table('Size', [numParticles, 2], ...
                      'VariableTypes', {'double', 'double'}, ...
                      'VariableNames', {'ID', 'AverageVelocity'});

% Calculate average velocity for each particle
for i = 1:numParticles
    avgVelocities.ID(i) = particles(i).ID;
    avgVelocities.AverageVelocity(i) = calculateAverageVelocity(particles(i));
end

% Display results in the command window
disp('Particle Average Velocities:');
disp(avgVelocities);

% Plot 3D trajectories of all particles
figure;
hold on;
for i = 1:numParticles
    plot3(particles(i).Position(:,1), particles(i).Position(:,2), particles(i).Position(:,3), ...
          'DisplayName', ['Particle ' num2str(particles(i).ID)]);
end
hold off;
grid on;
xlabel('X Position');
ylabel('Y Position');
zlabel('Z Position');
title('3D Trajectories of Particles');
legend show;
