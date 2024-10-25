function inventoryTable = getInventoryList(filename)
    % Check if the file exists
    if exist(filename, 'file') == 2
        % Open the file for reading
        fileID = fopen(filename, 'r');
        
        % Read the data from the file using textscan
        data = textscan(fileID, '%s %s %d', 'Delimiter', ',', 'HeaderLines', 1);
        
        fclose(fileID); % Close the file after reading
        
        % Create a table from the data
        inventoryTable = table(data{1}, data{2}, data{3}, 'VariableNames', {'UPC', 'Ingredient', 'Quantity'});
    else
        % If the file does not exist, return an empty table
        inventoryTable = table();
        disp('Inventory file does not exist.');
    end
end
