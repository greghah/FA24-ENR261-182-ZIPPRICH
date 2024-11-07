clear
clc

%Prompt User
maxDensity = input('enter the maximum acceptible density (kg.m^3): ');
minTensileStrength = input('Enter the minimum required tensile strength (MPa): ');
maxCost = input('Enter the maximum acceptable cost per kg (USD): ');

%define filename because I didn't feel like puting it in my function
filename = 'material_properties.csv';

%call function
filteredMaterials = filterMaterials(filename, maxDensity, minTensileStrength, maxCost);

%now we display
if ~isempty(filteredMaterials)
    disp('Materials that meet your criteria:');
    disp(filteredMaterials);
else
    disp('No materials meet the specified criteria.');
end
