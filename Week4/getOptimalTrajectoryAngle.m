% Student: Gregory Zipprich
% Assisted by: Nobody

function [optimal_angle,max_range] = getOptimalTrajectoryAngle(v0 ,y0 ,g )
    %initialising variables before we loop them
    max_range = 0;
    optimal_angle=0;

    %loop that actually tests each angle

    for angle = 0:1:90
        %calculates range for each angle
         range = (v0 * cosd(angle) / g) * (v0 * sind(angle) + sqrt((v0 * sind(angle))^2 + 2 * g * y0));


        if range>max_range
            max_range = range;
            optimal_angle = angle;
        end
    end
end
