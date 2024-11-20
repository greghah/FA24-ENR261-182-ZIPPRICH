function projectileMotionWithKeyPoints(v0, angle, g)
    % This function simulates projectile motion using initial velocity (v0),
    % launch angle (angle), and gravitational acceleration (g).

    % Convert angle to radians
    theta = deg2rad(angle);

    % Total time of flight
    t_flight = 2 * v0 * sin(theta) / g;

    % Time vector for plotting (from 0 to t_flight)
    t_over_time = linspace(0, t_flight, 1000);

    % Horizontal and vertical positions over time
    x = v0 * cos(theta) * t_over_time;
    y = v0 * sin(theta) * t_over_time - 0.5 * g * t_over_time.^2;

    % Maximum height (apex)
    ymax = (v0 * sin(theta))^2 / (2 * g);

    % Maximum range
    xmax = v0^2 * sin(2 * theta) / g;

    % Plot trajectory
    figure;

    % Subplot 1: Projectile Trajectory
    subplot(2, 1, 1);
    plot(x, y, 'b-', 'LineWidth', 1.5); hold on;
    scatter(x(end), 0, 80, 'r', 'filled', 'DisplayName', ['Max Range = ', num2str(xmax, '%.2f'), ' m']);
    scatter(x(y == max(y)), max(y), 80, 'g', 'filled', 'DisplayName', ['Apex = ', num2str(ymax, '%.2f'), ' m']);
    xlabel('Horizontal Distance (m)');
    ylabel('Vertical Height (m)');
    title('Projectile Trajectory');
    legend('show', 'Location', 'best');
    grid on;

    % Energy calculations
    m = 1; % Assume mass = 1 kg
    vx = v0 * cos(theta); % Horizontal velocity (constant)
    vy = v0 * sin(theta) - g * t_over_time; % Vertical velocity over time
    KE = 0.5 * m * (vx^2 + vy.^2); % Kinetic energy
    PE = m * g * y; % Potential energy
    PE(PE < 0) = 0; % Ensure potential energy is non-negative

    % Subplot 2: Kinetic and Potential Energy Over Time
    subplot(2, 1, 2);
    area(t_over_time, KE, 'FaceColor', 'blue', 'FaceAlpha', 0.5, 'DisplayName', 'Kinetic Energy'); hold on;
    area(t_over_time, PE, 'FaceColor', [1, 0.5, 0], 'FaceAlpha', 0.5, 'DisplayName', 'Potential Energy'); % RGB for orange
    xlabel('Time (s)');
    ylabel('Energy (J)');
    title('Kinetic and Potential Energy vs. Time');
    legend('show', 'Location', 'best');
    grid on;

    hold off;
end
