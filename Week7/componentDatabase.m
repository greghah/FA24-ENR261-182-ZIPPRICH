% File: componentDatabase.m
% Student: Gregory Zipprich
% Assisted by: Nobody

clc;
clear;

% Initialize an empty structure array
components = struct('ID', {}, 'Name', {}, 'Dimensions', {}, 'Material', {}, 'Weight', {});

% Define components and add them to the database
% Component 1: Beam
beam.ID = 1;
beam.Name = 'Beam';
beam.Dimensions = struct('Length', 2.5, 'Width', 0.3, 'Height', 0.5);
beam.Material = 'Steel';
beam.Weight = 150.0;
components = addComponent(components, beam);

% Component 2: Column
column.ID = 2;
column.Name = 'Column';
column.Dimensions = struct('Length', 3.0, 'Width', 0.4, 'Height', 0.4);
column.Material = 'Concrete';
column.Weight = 200.0;
components = addComponent(components, column);

% Component 3: Bolt
bolt.ID = 3;
bolt.Name = 'Bolt';
bolt.Dimensions = struct('Length', 0.1, 'Width', 0.02, 'Height', 0.02);
bolt.Material = 'Alloy';
bolt.Weight = 0.5;
components = addComponent(components, bolt);

% Convert the structure array to a table
componentTable = struct2Table(components);

% Save the table to a CSV file
writetable(componentTable, 'componentsDatabase.csv');

% Load the table back from the CSV file
loadedTable = readtable('componentsDatabase.csv');

% Display the contents of the database in a readable format
disp('Component Database:');
disp('ID   Name       Length (m)   Width (m)   Height (m)   Material      Weight (kg)');
disp('-------------------------------------------------------------------------------');
for i = 1:height(loadedTable)
    fprintf('%-4d %-10s %-12.2f %-10.2f %-12.2f %-12s %.2f\n', ...
        loadedTable.ID(i), loadedTable.Name{i}, loadedTable.Length(i), ...
        loadedTable.Width(i), loadedTable.Height(i), ...
        loadedTable.Material{i}, loadedTable.Weight(i));
end
