% Student: Gregory Zipprich
% Assisted by: Nobody

clear;
clc;
close all;

% Define recipes
recipes = {
    {'Pancakes', { ...
        struct('Name', 'Flour', 'Quantity', 200, 'Unit', 'grams'), ...
        struct('Name', 'Eggs', 'Quantity', 2, 'Unit', 'each'), ...
        struct('Name', 'Milk', 'Quantity', 300, 'Unit', 'ml')}}, ...
    {'Omelette', { ...
        struct('Name', 'Eggs', 'Quantity', 3, 'Unit', 'each'), ...
        struct('Name', 'Cheese', 'Quantity', 50, 'Unit', 'grams'), ...
        struct('Name', 'Salt', 'Quantity', 1, 'Unit', 'teaspoon')}}
};

% Define inventory table
inventoryTable = table({'Flour'; 'Eggs'; 'Milk'; 'Cheese'; 'Salt'}, ...
                       [1000; 10; 1000; 200; 100], ...
                       {'grams'; 'each'; 'ml'; 'grams'; 'teaspoon'}, ...
                       'VariableNames', {'Name', 'Quantity', 'Unit'});

% Save inventory to CSV file
writetable(inventoryTable, 'ingredientInventory.csv');

% Load inventory from CSV file
loadedInventoryTable = readtable('ingredientInventory.csv');

% Display recipes
disp('Recipes:');
for i = 1:length(recipes)
    fprintf('%d. %s\n', i, recipes{i}{1});
    ingredients = recipes{i}{2};
    for j = 1:length(ingredients)
        fprintf('   - %s: %g %s\n', ...
                ingredients{j}.Name, ...
                ingredients{j}.Quantity, ...
                ingredients{j}.Unit);
    end
end

% Update inventory based on a selected recipe
disp('Updating inventory for Pancakes...');
loadedInventoryTable = updateInventory(loadedInventoryTable, recipes{1});
disp('Inventory updated successfully.');

% Display the updated inventory
disp('Current Inventory:');
disp(loadedInventoryTable);

% Save the updated inventory back to the CSV file
writetable(loadedInventoryTable, 'ingredientInventory.csv');
