function qty = getStockQty(filename, upc)
    % Initialize quantity to -1, indicating 'not found'
    qty = -1;

    % Convert numeric UPC input to string if necessary
    if isnumeric(upc)
        upc = num2str(upc);
    end

    % Check if the file exists
    if exist(filename, 'file') == 2
        % Open the file for reading
        fileID = fopen(filename, 'r');
        
        % Read the data from the file
        data = textscan(fileID, '%s %s %d', 'Delimiter', ',', 'HeaderLines', 1);
        
        fclose(fileID); % Close the file after reading
        
        % Store UPC and quantity columns
        upcList = data{1};
        qtyList = data{3};
        
        % Loop through the UPC list to find the matching UPC
        for i = 1:length(upcList)
            if strcmp(upcList{i}, upc) % Check for a match
                qty = qtyList(i); % Get the corresponding quantity
                break; % Exit the loop since we found the item
            end
        end
    else
        disp('Inventory file does not exist.');
    end
end
