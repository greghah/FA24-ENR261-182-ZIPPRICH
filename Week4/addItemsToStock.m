%add items to stock function

function addItemsToStock(filename,upc,ingredient,qty)
    %check is file exists
    if exist(filename,'file')
        fileID = fopen(filename,"w");
    else
        %create new file with headers
        fileID = fopen(filename,'w');
        fprintf(fileID,'upc,ingredient,qty\n');
    end


    %add new ingredients
    fprintf(fileID,'upc,ingredient,qty');
    fclose(fileID);
end
