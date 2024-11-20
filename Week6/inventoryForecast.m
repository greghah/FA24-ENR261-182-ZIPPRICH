% Student: Gregory Zipprich
% Assisted by: Nobody

function [inventoryOverTime, y_future] = inventoryForecast(upc, totalDays, futureDays, inventoryFile, usageFile)
    % Load inventory and usage data
    try
        inventoryData = readtable(inventoryFile);
        usageData = readtable(usageFile);
    catch
        error('File error: please check if inventory and usage files exist.');
    end

    % Convert UPCs to strings for comparison
    upc = string(upc);
    inventoryData.upc = string(inventoryData.upc);
    usageData.upc = string(usageData.upc);

    % Find the initial quantity for the specified UPC
    initialRow = inventoryData.upc == upc;
    if sum(initialRow) == 0
        error('UPC not found in inventory file.');
    end
    initialQty = inventoryData.qty(initialRow); % Initial inventory level
    inventoryOverTime = zeros(totalDays, 1);  % Initialize inventory tracking
    inventoryOverTime(1) = initialQty;

    % Calculate daily inventory changes based on usage
    usageData = usageData(usageData.upc == upc, :);
    for day = 2:totalDays
        dailyUsage = sum(usageData.qty(usageData.day == day));
        inventoryOverTime(day) = inventoryOverTime(day - 1) + dailyUsage;
    end

    % Forecast future inventory levels with a linear trend
    p = polyfit((1:totalDays)', inventoryOverTime, 1);
    y_future = polyval(p, (totalDays+1:totalDays+futureDays)');
    y_future(y_future < 0) = 0; % Cap at zero for non-negative inventory
end
