% Student: Gregory Zipprich
% Assisted by: Nobody

function [p, R_squared] = fitStressStrainCurve(materialName, degree, showPlot)
    % Set default values for optional inputs if they are not provided
    if nargin < 2
        degree = 2; % Default polynomial degree
    end

    if nargin < 3
        showPlot = true; % Default to show plot
    end

    % Try to read data file
    try
        data = readtable([materialName, '.csv']);
        strain = data.Strain;
        stress = data.Stress;
    catch
        error('The specified file does not exist or cannot be read. Please check the file name and directory.');
    end

    % Validate that the degree is a positive integer
    if ~isnumeric(degree) || degree < 1 || floor(degree) ~= degree
        error('The polynomial degree must be a positive integer.');
    end

    % Fit the polynomial
    p = polyfit(strain, stress, degree);
    
    % Calculate fitted values and R-squared
    fittedValues = polyval(p, strain);
    SS_res = sum((stress - fittedValues).^2);
    SS_tot = sum((stress - mean(stress)).^2);
    R_squared = 1 - (SS_res / SS_tot);

    % Plot if showPlot is true
    if showPlot
        figure;
        plot(strain, stress, 'o', 'DisplayName', 'Original Data');
        hold on;
        plot(strain, fittedValues, '-', 'DisplayName', ['Polynomial Fit (Degree ', num2str(degree), ')']);
        xlabel('Strain');
        ylabel('Stress');
        legend show;
        title([materialName, ' Stress-Strain Curve']);
        hold off;
    end
end
