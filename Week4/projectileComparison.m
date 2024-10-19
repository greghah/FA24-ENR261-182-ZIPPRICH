% Student: Gregory Zipprich
% Assisted by: Nobody
clc
clear

%prompt user for v0, y0 and their guess

v0 = input('Enter the initial velocity (in m/s): ');
y0 = input('the initial height (in meters): ');
guess = input('your guess for the optimal angle (in degrees): ');

%gravity constant

g=9.81;

%the number of divisions in time displayed by the graph is defined here

numValues=100;

%get the optimal angle and maximum range

[optimal_angle,max_range] = getOptimalTrajectoryAngle(v0,y0,g);

%calculate trajectory for guesed angle

[x_guess,y_guess,~] = calculateTrajectory(v0, guess, y0, g, numValues);

%calculate trajectory for the optimal angle

[x,y,~] = calculateTrajectory(v0, optimal_angle, y0, g, numValues);

%create new figure to display the plot

figure;
%plot guess angle in red
plot(x_guess, y_guess, '-r', 'DisplayName', sprintf('Guessed Angle: %.2f', guess));
hold on;
%plot optimal angle in blue
plot(x,y,'-b','DisplayName',sprintf('Optimal Angle: %.2f', optimal_angle));
xlabel('Distance(meters)');
ylabel('Height(meters)');
title('Trajectories(guessed angle in red vs. optimal angle in blue)')

fprintf('Opt launch angle: %.2f degrees \n', optimal_angle);
fprintf('Maximum range: %.2f meters \n', max_range);
fprintf('Your guess angle was off by: %.2f degrees \n', abs(optimal_angle - guess));

