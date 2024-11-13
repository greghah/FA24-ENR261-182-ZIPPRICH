% Student: Gregory Zipprich
% Assisted by: Nobody

% Clear the workspace, command window, and close all figures
clc;
clear;
close all;

% Prompt the user to select a material
disp('Please choose a material:');
disp('1. Steel');
disp('2. Aluminum');
disp('3. Brass');
materialChoice = input('Enter a numeric input (1, 2, or 3): ');

% Map the user’s choice to a material name
materials = {'Steel', 'Aluminum', 'Brass'};
if materialChoice >= 1 && materialChoice <= 3
    materialName = materials{materialChoice};
else
    error('Invalid choice. Please select a number between 1 and 3.');
end

% Prompt the user for the degree of the polynomial to fit
degree = input('Enter the degree of the polynomial to fit: ');

% Prompt the user for whether to display the plot or not
showPlotInput = input('Do you want to display the plot? (1 for Yes, 0 for No): ');
showPlot = showPlotInput == 1;

% Call the fitStressStrainCurve function with the user inputs
[p, R_squared] = fitStressStrainCurve(materialName, degree, showPlot);

% Display the polynomial coefficients and R-squared value
fprintf('Polynomial Coefficients:\n');
disp(p);
fprintf('R-squared Value: %.4f\n', R_squared);