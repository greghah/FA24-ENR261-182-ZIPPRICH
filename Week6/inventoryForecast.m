% Student: Gregory Zipprich
% Assisted by: Nobody

function [x, inventoryOverTime, x_future, y_future] = inventoryForecast(upc, totalDays, futureDays, inventoryFile, usageFile)
    % This function estimates the inventory of items based on previous usage.

    % Load the files with try-catch error handling
    try
        inventoryData = readtable(inventoryFile);
        usageData = readtable(usageFile);
    catch
        error('File error: please check if inventory and usage files exist.');
    end

    % Convert UPCs to strings for easier comparison
    upc = string(upc);
    inventoryData.upc = string(inventoryData.upc);
    usageData.upc = string(usageData.upc);

    % Find the initial row for the specified UPC and check if it exists
    initialRow = inventoryData.upc == upc;
    if sum(initialRow) == 0
        error('UPC not found in inventory file.');
    end
    initialQty = inventoryData.qty(initialRow);

    % Filter usage data for the specified UPC and time period
    usageData = usageData(usageData.upc == upc & usageData.day <= totalDays, :);

    % Initialize inventory over time
    inventoryOverTime = zeros(totalDays, 1);
    inventoryOverTime(1) = initialQty;

    % Calculate inventory change for each day
    for day = 2:totalDays
        dailyUsage = sum(usageData.qty(usageData.day == day));

        % Adjust inventory based on whether dailyUsage is positive (restocking) or negative (usage)
        inventoryOverTime(day) = inventoryOverTime(day - 1) + dailyUsage;

        % Debugging output to verify daily usage
        fprintf('Day %d: Initial Qty = %.2f, Daily Usage = %.2f, Remaining Qty = %.2f\n', ...
            day, inventoryOverTime(day - 1), dailyUsage, inventoryOverTime(day));
    end

    % Define the x and x_future variables for compatibility with the test file
    x = (1:totalDays)';  % Represents the days for the historical inventory data
    x_future = (totalDays + 1:totalDays + futureDays)';  % Represents the future days for forecasting

    % Forecast future inventory using a linear trend (avoiding negative forecasts)
    p = polyfit(x, inventoryOverTime, 1);
    y_future = polyval(p, x_future);
    y_future(y_future < 0) = 0; % Cap forecast at zero to avoid negative inventory

    % Debugging output for vector sizes
    fprintf('Size of x: %d\n', length(x));
    fprintf('Size of inventoryOverTime: %d\n', length(inventoryOverTime));
    fprintf('Size of x_future: %d\n', length(x_future));
    fprintf('Size of y_future: %d\n', length(y_future));
end
