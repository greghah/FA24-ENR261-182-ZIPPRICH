% Student: Gregory Zipprich
% Assisted by: Nobody


function inventoryTable = updateInventory(inventoryTable, recipeCell)
    % Access the second element of stored data, which is the ingredients
    recipeIngredients = recipeCell{2};
    
    % Cycle through the ingredients in the second element
    for i = 1:length(recipeIngredients)
        % Extract ingredient details
        ingredientName = recipeIngredients{i}.Name;
        ingredientQuantity = recipeIngredients{i}.Quantity;
        ingredientUnit = recipeIngredients{i}.Unit;
        
        % Find the matching ingredient in inventory by comparing the strings
        idx = find(strcmp(inventoryTable.Name, ingredientName));
        
        % Only subtract if the ingredient exists in the inventory
        if ~isempty(idx)
            inventoryTable.Quantity(idx) = inventoryTable.Quantity(idx) - ingredientQuantity;
        else
            disp(['Ingredient "', ingredientName, '" not found in inventory.']);
        end
    end
end
