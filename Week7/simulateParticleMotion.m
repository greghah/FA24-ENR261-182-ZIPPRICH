function particles = simulateParticleMotion(numParticles, numTimeSteps)
    % Initialize structure array to store particle data
    particles = struct('ID', {}, 'Position', {}, 'Time', {});

    % Loop through each particle
    for i = 1:numParticles
        % Assign ID
        particles(i).ID = i;
        
        % Generate random positions (Nx3 matrix for X, Y, Z)
        particles(i).Position = cumsum(randn(numTimeSteps, 3), 1); 
        
        % Generate time vector (uniform time steps)
        particles(i).Time = linspace(0, 10, numTimeSteps)';
    end
end
