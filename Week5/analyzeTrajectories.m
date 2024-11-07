% Student: Gregory Zipprich
% Assisted by: Nobody



function [aboveAverageAngles, maxRange, optimalAngle] = analyzeTrajectories(angles, ranges)
    % Calculate the average range
    averageRange = mean(ranges);

    % Use logical vector to find indices where range is above average
    aboveAverageIndices = ranges > averageRange;

    % Extract angles with above-average ranges
    aboveAverageAngles = angles(aboveAverageIndices);

    % Find the maximum range and the index of the maximum range
    [maxRange, maxIndex] = max(ranges);

    % Find the corresponding optimal angle for the maximum range
    optimalAngle = angles(maxIndex);
end
