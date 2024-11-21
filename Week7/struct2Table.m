% Student: Gregory Zipprich
% Assisted by: Nobody

function tbl = struct2Table(structArray)
    %define structure commponents
    ID = [structArray.ID]'; %store numeric values in a regular column vector using a row vector transposed by '
    Name = {structArray.Name}'; %store non numeric values in a cell using {}
    Length = arrayfun(@(x) x.Dimensions.Length, structArray)'; % Extract nested Length using the arrayversion of cellfun
    Width = arrayfun(@(x) x.Dimensions.Width, structArray)';   % Extract nested Width
    Height = arrayfun(@(x) x.Dimensions.Height, structArray)'; % Extract nested Height

    Material = {structArray.Material}';
    Weight = [structArray.Weight]';
    %curly brackets extract the string data into cell arrays
    %regular brackets extract the numeric data into colloms vectors

    tbl = table(ID,Name,Length,Width,Height,Material,Weight,'VariableNames',{'ID','Name','Length','Width','Height','Material','Weight'});
end
