% Student: Gregory Zipprich
% Assisted by: Nobody
function [x,y,total_time] = calculateTrajectory(v0, angle, y0, g, numValues)
    

    %calculate x and y components of velocity
    vx=v0*cosd(angle); 
    vy=v0*sind(angle);

    total_time = (vy + sqrt(vy^2 + 2 * g * y0)) / g;
    time = linspace(0,total_time,numValues);

    %final position

    x=vx*time;
    y=vy*time-.5*g*time.^2 + y0;
end