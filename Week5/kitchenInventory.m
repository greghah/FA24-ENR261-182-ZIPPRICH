clc
clear

disp('Welcome to the Kitchen Inventory Manager!');
while true
    disp('----------------------------------');
    disp('| Please select an option:');
    disp('| 1. Add an ingredient');
    disp('| 2. Print inventory list');
    disp('| 3. Check ingredient quantity by UPC');
    disp('| 4. Check for low-stock items');
    disp('| 0. Exit');
    disp('----------------------------------');
    choice = input('> ', 's');

    switch choice
        case '1'
            % Add an ingredient
            upc = input('Enter the UPC: ', 's');
            ingredient = input('Enter the ingredient name: ', 's');
            qty = input('Enter the quantity: ');
            addItemToStock('inventory.csv', upc, ingredient, qty); % Corrected function name

        case '2'
            % Print the inventory list
            inventoryTable = getInventoryList('inventory.csv');
            if ~isempty(inventoryTable)
                disp('Inventory List:');
                disp(inventoryTable);
            else
                disp('No items in inventory.');
            end

        case '3'
            % Check quantity by UPC
            upc = input('Enter the UPC: ', 's');
            qty = getStockQty('inventory.csv', upc);
            if qty == -1
                disp(['UPC ', upc, ' not found in inventory.']);
            else
                disp(['UPC ', upc, ' - Quantity: ', num2str(qty)]);
            end

        case '4'
            % Check for low-stock items
            threshold = input('Enter the low-stock threshold: ');
            lowStockItems = getLowStockItems('inventory.csv', threshold);
            if ~isempty(lowStockItems)
                disp('Items low on stock:');
                disp(lowStockItems);
            end
        case '0'
            % Exit the program
            disp('Goodbye!');
            break;

        otherwise
            disp('Invalid option. Please try again.');
    end
end
