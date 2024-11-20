% Student: Gregory Zipprich
% Assisted by: Nobody

% Clear the workspace, command window, and close all figures
clc; 
clear;
close all;  

% Display available ingredients for reference
disp('Available ingredients for analysis:');
disp(['upc             ingredient']);
disp(['"123456789012"  Tomato']);
disp(['"987654321098"  Mayonnaise']);
disp(['"111213141516"  Flour']);
disp(['"121314151617"  Sugar']);
disp(['"131415161718"  Milk']);
disp(['"141516171819"  Eggs']);
disp(['"151617181920"  Butter']);

% Prompt for user input
upc = input('Enter the UPC of the ingredient you want to analyze: ', 's');
futureDays = input('How many days would you like to forecast? ');

% Define constants
totalDays = 90;
inventoryFile = 'Inventory.csv';
usageFile = 'UsageLog.csv';

try
    % Call the inventoryForecast function
    [inventoryOverTime, y_future] = inventoryForecast(upc, totalDays, futureDays, inventoryFile, usageFile);

    % Plot historical and forecasted inventory
    figure;
    hold on;
    plot(1:totalDays, inventoryOverTime, 'b', 'DisplayName', 'Historical Inventory');
    plot(totalDays+1:totalDays+futureDays, y_future, 'r--', 'DisplayName', 'Forecasted Inventory');
    legend('Location', 'best');
    xlabel('Day');
    ylabel('Inventory Quantity');
    title(['Inventory Forecast for UPC: ', upc]);
    hold off;
catch ME
    % Display error message
    disp('An error occurred:');
    disp(ME.message);
end
