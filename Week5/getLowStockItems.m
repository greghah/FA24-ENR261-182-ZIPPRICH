function lowStockItems = getLowStockItems(filename,threshold)

%convert csv file into a table
    inventoryTable = readtable(filename, 'TextType', 'string')

    lowStock = inventoryTable.qty <= threshold;

    lowStockItems = inventoryTable(lowStock, :);

    if isempty(lowStockItems)
        disp('No Items Are Low On Stock')
    end
end
