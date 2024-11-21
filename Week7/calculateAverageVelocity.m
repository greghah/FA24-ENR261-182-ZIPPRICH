function avgVelocity = calculateAverageVelocity(particle)
    %extract position and time to tables
    positions = particle.Position;
    time = particle.Time;

    displacements = sqrt(sum(diff(positions).^2, 2)); 

    timeIntervals = diff(time);

    velocities = displacements./timeIntervals
    avgVelocity = mean(velocities);
end
