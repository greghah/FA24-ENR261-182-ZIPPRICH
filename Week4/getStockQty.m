% Student: Gregory Zipprich
% Assisted by: Nobody

function qty = getStockQty(filename,upc)
    %initialize variable assuming that it is not found
    qty=-1
    %check if the file exists
    if exist(filename,"file") == 2
        %open file in read mode, store that opening function as fileID to
        %use later
        fileID = fopen(filename,"r")

        %read data using textscan and storing it as variable data
        data=textscan(fileID, '%s,%s,%d','Delimiter',',','Headerlines',1);

        fclose(fileID); %close file afterwards to help prevent future errors with matlab

        upcList = data{1} %stores the 1st collomn

        qtyList = data{3} %stores the 3rd collomn
        % Loop through the UPC list to find the matching UPC
        for i = 1:length(upcList)
            if strcmp(upcList{i}, upc) % Check for a match
                qty = qtyList(i); % Get the corresponding quantity
                break; % Exit the loop since we found the item
            end
        end
    end
end


